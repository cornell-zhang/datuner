//==========================================================================
//digitrec.cpp
//==========================================================================
// @brief: A k-nearest-neighbors implementation for digit recognition

#include "optical_flow.h"

#include <iostream>
//#include <hls_video.h>
#include <assert.h>


void optical_flow(pixel_t frame1[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame2[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame3[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame4[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame5[MAX_HEIGHT][MAX_WIDTH],
    velocity_t output[MAX_HEIGHT][MAX_WIDTH],
    gradient_t grad[MAX_HEIGHT][MAX_WIDTH],
    tensor_t tensor_out[MAX_HEIGHT][MAX_WIDTH])
{

    static pixel_t gradient_x[MAX_HEIGHT][MAX_WIDTH];
    static pixel_t gradient_y[MAX_HEIGHT][MAX_WIDTH];
    static pixel_t gradient_z[MAX_HEIGHT][MAX_WIDTH];
    static gradient_t y_filtered[MAX_HEIGHT][MAX_WIDTH];
    static gradient_t filtered_gradient[MAX_HEIGHT][MAX_WIDTH];
    static outer_t out_product[MAX_HEIGHT][MAX_WIDTH];
    static tensor_t tensor_y[MAX_HEIGHT][MAX_WIDTH];
    static tensor_t tensor[MAX_HEIGHT][MAX_WIDTH];

    // Need to duplicate frame3 for the two calculations
    static pixel_t frame3_a[MAX_HEIGHT][MAX_WIDTH];
    static pixel_t frame3_b[MAX_HEIGHT][MAX_WIDTH];
    for (int r=0; r<MAX_HEIGHT; r++) {
      for (int c=0; c<MAX_WIDTH; c++) {
        assert(r >= 0 && r < MAX_HEIGHT);
        assert(c >= 0 && c < MAX_WIDTH);
        pixel_t pix = frame3[r][c];
        frame3_a[r][c] = pix;
        frame3_b[r][c] = pix;
      }
    }


    gradient_xy_calc(frame3_a, gradient_x, gradient_y);
    gradient_z_calc(frame1, frame2, frame3_b, frame4, frame5, gradient_z);
    gradient_weight_y(gradient_x, gradient_y, gradient_z, y_filtered);
    gradient_weight_x(y_filtered, filtered_gradient);
    for (int r=0; r<MAX_HEIGHT; r++) {
      for (int c=0; c<MAX_WIDTH; c++) {
        grad[r][c].x = gradient_x[r][c];
        grad[r][c].y = gradient_y[r][c];
        grad[r][c].z = gradient_z[r][c];
      }
    }
    outer_product(filtered_gradient, out_product);
    tensor_weight_y(out_product, tensor_y);
    tensor_weight_x(tensor_y, tensor);
    flow_calc(tensor, output);

    for (int r=0; r<MAX_HEIGHT; r++) {
      for (int c=0; c<MAX_WIDTH; c++) {
        for (int k=0; k<6; k++) {
          tensor_out[r][c].val[k] = tensor[r][c].val[k];
        }
      }
    }
}



void gradient_xy_calc(pixel_t frame[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_x[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_y[MAX_HEIGHT][MAX_WIDTH])
{
    pixel_t x_grad, y_grad;
    for(int r=0; r<MAX_HEIGHT+2; r++){
        for(int c=0; c<MAX_WIDTH+2; c++){
            x_grad = 0;
            y_grad = 0;
            if(r>=4 && r<MAX_HEIGHT && c>=4 && c<MAX_WIDTH){
                assert((r-2) >= 0 && (r-2) < MAX_HEIGHT);
                assert((c-2) >= 0 && (c-2) < MAX_WIDTH);
                for(int i=0; i<5; i++){
                    x_grad += frame[r-2][c-i]*GRAD_WEIGHTS[4-i];
                    y_grad += frame[r-i][c-2]*GRAD_WEIGHTS[4-i];
                }
                gradient_x[r-2][c-2] = x_grad/12;
                gradient_y[r-2][c-2] = y_grad/12;
            }
            else if(r>=2 && c>=2){
                assert((r-2) >= 0 && (r-2) < MAX_HEIGHT);
                assert((c-2) >= 0 && (c-2) < MAX_WIDTH);
                gradient_x[r-2][c-2] = 0;
                gradient_y[r-2][c-2] = 0;
            }
        }
    }
}

/*
void gradient_xy_calc(pixel_t frame[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_x[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_y[MAX_HEIGHT][MAX_WIDTH])
{
    for(int r=0; r<MAX_HEIGHT+2; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            pixel_t x_grad = 0;
            pixel_t y_grad = 0;
            for(int i=-2; i<3; i++){
                if(c+i>=0 && c+i < MAX_WIDTH){
                    x_grad += frame[r][c+i]*GRAD_WEIGHTS[i+2];
                }
                if(r+i>=0 && r+i < MAX_HEIGHT){
                    y_grad += frame[r+i][c]*GRAD_WEIGHTS[i+2];
                }
            }
            gradient_x[r][c] = x_grad/12;
            gradient_y[r][c] = y_grad/12;
        }
    }
}
*/

void gradient_z_calc(pixel_t frame1[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame2[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame3[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame4[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame5[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t gradient_z[MAX_HEIGHT][MAX_WIDTH])
{
    for(int r=0; r<MAX_HEIGHT; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            assert(r >= 0 && r < MAX_HEIGHT);
            assert(c >= 0 && c < MAX_WIDTH);
            gradient_z[r][c] = (frame1[r][c]*GRAD_WEIGHTS[0] 
                + frame2[r][c]*GRAD_WEIGHTS[1]
                + frame3[r][c]*GRAD_WEIGHTS[2]
                + frame4[r][c]*GRAD_WEIGHTS[3]
                + frame5[r][c]*GRAD_WEIGHTS[4])/12;
        }
    }
}

void gradient_weight_y(pixel_t gradient_x[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_y[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_z[MAX_HEIGHT][MAX_WIDTH],
    gradient_t filt_grad[MAX_HEIGHT][MAX_WIDTH])
{
    for(int r=0; r<MAX_HEIGHT+3; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            //std::cout << gradient_x[r][c] << " r" << r << " c" << c << std::endl;
            gradient_t acc;
            acc.x = 0;
            acc.y = 0;
            acc.z = 0;
            if(r >= 6 && r<MAX_HEIGHT){ 
                for(int i=0; i<7; i++){
                        acc.x += gradient_x[r-i][c]*GRAD_FILTER[i];
                        acc.y += gradient_y[r-i][c]*GRAD_FILTER[i];
                        acc.z += gradient_z[r-i][c]*GRAD_FILTER[i];
                }
                assert((r-3) >= 0 && (r-3) < MAX_HEIGHT);
                assert(c >= 0 && c < MAX_WIDTH);
                filt_grad[r-3][c] = acc;            
            }
            else if(r>=3){
                assert((r-3) >= 0 && (r-3) < MAX_HEIGHT);
                assert(c >= 0 && c < MAX_WIDTH);
                filt_grad[r-3][c] = acc;
            }
        }
    }
}

void gradient_weight_x(gradient_t y_filt[MAX_HEIGHT][MAX_WIDTH],
    gradient_t filt_grad[MAX_HEIGHT][MAX_WIDTH])
{
    for(int r=0; r<MAX_HEIGHT; r++){
        for(int c=0; c<MAX_WIDTH+3; c++){
            gradient_t acc;
            acc.x = 0;
            acc.y = 0;
            acc.z = 0;
            if(c >= 6 && c<MAX_WIDTH){
                for(int i=0; i<7; i++){
                    acc.x += y_filt[r][c-i].x*GRAD_FILTER[i];
                    acc.y += y_filt[r][c-i].y*GRAD_FILTER[i];
                    acc.z += y_filt[r][c-i].z*GRAD_FILTER[i];
                }
                assert(r >= 0 && r < MAX_HEIGHT);
                assert((c-3) >= 0 && (c-3) < MAX_WIDTH);
                filt_grad[r][c-3] = acc;
            }
            else if(c>=3){
                assert(r >= 0 && r < MAX_HEIGHT);
                assert((c-3) >= 0 && (c-3) < MAX_WIDTH);
                filt_grad[r][c-3] = acc;
            }
        }
    }
}
 
void outer_product(gradient_t gradient[MAX_HEIGHT][MAX_WIDTH],
     outer_t outer_product[MAX_HEIGHT][MAX_WIDTH])
{
    
    for(int r=0; r<MAX_HEIGHT; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            assert(r >= 0 && r < MAX_HEIGHT);
            assert(c >= 0 && c < MAX_WIDTH);
            gradient_t grad = gradient[r][c];
            outer_t out;
            out.val[0] = grad.x*grad.x;
            out.val[1] = grad.y*grad.y;
            out.val[2] = grad.z*grad.z;
            out.val[3] = grad.x*grad.y;
            out.val[4] = grad.x*grad.z;
            out.val[5] = grad.y*grad.z;
            outer_product[r][c] = out;
        }
    }
}
/*
void tensor_weight(outer_t outer[MAX_HEIGHT][MAX_WIDTH],
    tensor_t tensor[MAX_HEIGHT][MAX_WIDTH])
{
    tensor_t tmp[MAX_HEIGHT][MAX_WIDTH];
    for(int r=0; r<MAX_HEIGHT; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            for(int k=0; k<6; k++){
                tmp[r][c].val[k] = 0;
                for(int i=0; i<3; i++){
                    if(c+i-1>=0 && c+i-1<MAX_WIDTH){
                        tmp[r][c].val[k] += outer[r][c+i-1].val[k]*TENSOR_FILTER[i];
                    }
                }
            }            
        }
    }
    for(int r=0; r<MAX_HEIGHT; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            for(int k=0; k<6; k++){
                tensor[r][c].val[k] = 0;
                for(int i=0; i<3; i++){
                    if(r+i-1>=0 && r+i-1<MAX_HEIGHT){
                        tensor[r][c].val[k] += tmp[r+i-1][c].val[k]*TENSOR_FILTER[i];
                    }
                }
               //std::cout << tensor[r][c].val[k] << " r" << r << " c" << c << std::endl;
            }            
        }
    }
}
*/
void tensor_weight_y(outer_t outer[MAX_HEIGHT][MAX_WIDTH],
    tensor_t tensor_y[MAX_HEIGHT][MAX_WIDTH])
{
    for(int r=0; r<MAX_HEIGHT+1; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            //std::cout << gradient_x[r][c] << " r" << r << " c" << c << std::endl;
            tensor_t acc;
            for(int k =0; k<6; k++){
                acc.val[k] = 0;
            }
            if (r >= 2 && r < MAX_HEIGHT) {
                for(int i=0; i<3; i++){
                    for(int component=0; component<6; component++){
                        acc.val[component] += outer[r-i][c].val[component]*TENSOR_FILTER[i];
                    }
                }
            }
            if(r >= 1){ 
                assert((r-1) >= 0 && (r-1) < MAX_HEIGHT);
                assert(c >= 0 && c < MAX_WIDTH);
                tensor_y[r-1][c] = acc;            
            }
        }
    }
}

void tensor_weight_x(tensor_t tensor_y[MAX_HEIGHT][MAX_WIDTH],
    tensor_t tensor[MAX_HEIGHT][MAX_WIDTH])
{
    for(int r=0; r<MAX_HEIGHT; r++){
        for(int c=0; c<MAX_WIDTH+1; c++){
            tensor_t acc;
            for(int k =0; k<6; k++){
                acc.val[k] = 0;
            }
            if (c >= 2 && c < MAX_WIDTH) {
                for(int i=0; i<3; i++){
                    for(int component=0; component<6; component++){
                        acc.val[component] += tensor_y[r][c-i].val[component]*TENSOR_FILTER[i];
                    }
                }
            }
            if(c>=1){
                assert(r >= 0 && r < MAX_HEIGHT);
                assert((c-1) >= 0 && (c-1) < MAX_WIDTH);
                tensor[r][c-1] = acc;
            }
        }
    }
}

void flow_calc(tensor_t tensors[MAX_HEIGHT][MAX_WIDTH],
    velocity_t output[MAX_HEIGHT][MAX_WIDTH])
{
    for(int r=0; r<MAX_HEIGHT; r++){
        for(int c=0; c<MAX_WIDTH; c++){
            assert(r >= 0 && r < MAX_HEIGHT);
            assert(c >= 0 && c < MAX_WIDTH);
            if(r>=2 && r<MAX_HEIGHT-2 && c>=2 && c<MAX_WIDTH-2){
                pixel_t denom = tensors[r][c].val[0]*tensors[r][c].val[1]-
                    tensors[r][c].val[3]*tensors[r][c].val[3];
                //if(denom > 0.001){
                    output[r][c].x = (tensors[r][c].val[5]*tensors[r][c].val[3]-
                        tensors[r][c].val[4]*tensors[r][c].val[1]) / denom;
                    output[r][c].y = (tensors[r][c].val[4]*tensors[r][c].val[3]-
                        tensors[r][c].val[5]*tensors[r][c].val[0]) / denom;
                //std::cout << "x" << output[r][c].x << " y" << output[r][c].y 
                //<< " r" << r << " c" << c << std::endl;
                //} else {
                //  output[r][c].x = 0;
                //  output[r][c].y = 0;
                //}
            }
            else{
                output[r][c].x = 0;
                output[r][c].y = 0;
            }
        }
    }
}














