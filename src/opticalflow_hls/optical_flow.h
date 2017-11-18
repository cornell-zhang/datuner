//===========================================================================
// optical_flow.h
//===========================================================================
// @brief: This header file defines the interface for the core functions.

#ifndef OPTICAL_FLOW_H
#define OPTICAL_FLOW_H

#include "typedefs.h"

#define MAX_HEIGHT 436
#define MAX_WIDTH 1024

const int GRAD_WEIGHTS[] =  {1,-8,0,8,-1};

const pixel_t GRAD_FILTER[] = {0.0755, 0.133, 0.1869, 0.2903, 0.1869, 0.133, 0.0755};

const pixel_t TENSOR_FILTER[] = {0.3243, 0.3513, 0.3243};

void optical_flow(pixel_t frame1[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame2[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame3[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame4[MAX_HEIGHT][MAX_WIDTH], 
    pixel_t frame5[MAX_HEIGHT][MAX_WIDTH], 
    velocity_t output[MAX_HEIGHT][MAX_WIDTH],
    gradient_t grad[MAX_HEIGHT][MAX_WIDTH],
    tensor_t tensor_out[MAX_HEIGHT][MAX_WIDTH]);

void gradient_xy_calc(pixel_t frame[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_x[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_y[MAX_HEIGHT][MAX_WIDTH]);

void gradient_z_calc(pixel_t frame1[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame2[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame3[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame4[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame5[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_z[MAX_HEIGHT][MAX_WIDTH]);

void gradient_weight_y(pixel_t gradient_x[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_y[MAX_HEIGHT][MAX_WIDTH],
    pixel_t gradient_z[MAX_HEIGHT][MAX_WIDTH],
    gradient_t filt_grad[MAX_HEIGHT][MAX_WIDTH]);

void gradient_weight_x(gradient_t y_filt[MAX_HEIGHT][MAX_WIDTH],
    gradient_t filt_grad[MAX_HEIGHT][MAX_WIDTH]);

void outer_product(gradient_t gradient[MAX_HEIGHT][MAX_WIDTH],
     outer_t outer_product[MAX_HEIGHT][MAX_WIDTH]);

void tensor_weight_y(outer_t outer[MAX_HEIGHT][MAX_WIDTH],
    tensor_t tensor_y[MAX_HEIGHT][MAX_WIDTH]);

void tensor_weight_x(tensor_t tensor_y[MAX_HEIGHT][MAX_WIDTH],
    tensor_t tensor[MAX_HEIGHT][MAX_WIDTH]);

void flow_calc(tensor_t tensors[MAX_HEIGHT][MAX_WIDTH],
    velocity_t output[MAX_HEIGHT][MAX_WIDTH]);

#endif
