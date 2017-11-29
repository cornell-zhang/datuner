// vim: ts=2:sw=2
//=========================================================================
// optical_flow_test.cpp
//=========================================================================
// @brief: testbench for k-nearest-neighbor digit recongnition application

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>

#include "optical_flow.h"

#include "./dependencies/imageLib/imageLib.h"

using namespace std;

pixel_t frames[5][MAX_HEIGHT][MAX_WIDTH];
velocity_t output[MAX_HEIGHT][MAX_WIDTH];
gradient_t grad_out[MAX_HEIGHT][MAX_WIDTH];
tensor_t tensor_out[MAX_HEIGHT][MAX_WIDTH];


int main(int argc, char *argv[])
{
	if (argc != 8) {
		std::cout << "Usage: optical_flow <img0> <img1> <img2> <img3> <img4> <out.flo> <reference.flo>" << std::endl;
		return -1;
	}
	std::string img_fnames[5];
	for (int i = 0; i < 5; i++) {
		img_fnames[i] = argv[i+1];
	}

	std::string out_fname = argv[6];
	std::string ref_fname = argv[7];

	for (int i = 0; i < 5; i++) {
		std::cout << "img" << i << ": " << img_fnames[i] << std::endl;
	}
	std::cout << "out.flo: " << out_fname << std::endl;
	std::cout << "reference.flo: " << ref_fname << std::endl;

	try {
		CByteImage imgs[5];
		for (int i = 0; i < 5; i++) {
			CByteImage tmpImg;
			ReadImage(tmpImg, img_fnames[i].c_str());
			imgs[i] = ConvertToGray(tmpImg);
		}
		WriteImage(imgs[1], "gray.png");
    std::cout << "reading in images" << std::endl;
		for (int i = 0; i < MAX_HEIGHT; i++) {
			for (int j = 0; j < MAX_WIDTH; j++) {
				for (int img = 0; img < 5; img++) {
					frames[img][i][j] = imgs[img].Pixel(j, i, 0) / 255.0f;
				}
			}
		}
    
		CFloatImage refFlow;
		ReadFlowFile(refFlow, ref_fname.c_str());
		std::cout << "Now Running optical flow..." << std::endl;

//		TIME_STAMP_INIT
		// Run the actual code
		optical_flow(frames[0],frames[1],frames[2],frames[3],frames[4], output, grad_out, tensor_out);
		//optical_flow(frames[0],frames[1],frames[2],frames[3],frames[4], output_x, output_y);//, grad_out, tensor_out);
		//optical_flow(frames[0],frames[1],frames[2],frames[3],frames[4], output_x, output_y);//, grad_out, tensor_out);
//		TIME_STAMP_ACCEL

		CFloatImage outFlow(MAX_WIDTH, MAX_HEIGHT, 2);
		for (int i = 0; i < MAX_HEIGHT; i++) {
			for (int j = 0; j < MAX_WIDTH; j++) {
				double out_x = output[i][j].x;
				double out_y = output[i][j].y;
				if (out_x*out_x + out_y*out_y > 25.0) {
					outFlow.Pixel(j, i, 0) = 1e10;
					outFlow.Pixel(j, i, 1) = 1e10;
				} else {
					outFlow.Pixel(j, i, 0) = out_x;
					outFlow.Pixel(j, i, 1) = out_y;
				}
			}
		}
		WriteFlowFile(outFlow, out_fname.c_str());


  float grad_max = 0.0f;
  for (int i = 0; i < MAX_HEIGHT; i++) {
    for (int j = 0; j < MAX_WIDTH; j++) {
      grad_max = fmax(grad_max, fabs(grad_out[i][j].x));
      grad_max = fmax(grad_max, fabs(grad_out[i][j].y));
      grad_max = fmax(grad_max, fabs(grad_out[i][j].z));
    }
  }
  std::cout << "grad_max = " << grad_max << std::endl;
  CByteImage outGrad_x(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outGrad_y(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outGrad_z(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outGrad(MAX_WIDTH, MAX_HEIGHT, 3);
  for (int i = 0; i < MAX_HEIGHT; i++) {
    for (int j = 0; j < MAX_WIDTH; j++) {
      outGrad.Pixel(j, i, 0) = 255 * (0.5f + (grad_out[i][j].x / grad_max)/2.0f);
      outGrad.Pixel(j, i, 1) = 255 * (0.5f + (grad_out[i][j].y / grad_max)/2.0f);
      outGrad.Pixel(j, i, 2) = 255 * (0.5f + (grad_out[i][j].z / grad_max)/2.0f);
      outGrad_x.Pixel(j, i, 0) = 255 * (0.5f + (grad_out[i][j].x / grad_max)/2.0f);
      outGrad_y.Pixel(j, i, 0) = 255 * (0.5f + (grad_out[i][j].y / grad_max)/2.0f);
      outGrad_z.Pixel(j, i, 0) = 255 * (0.5f + (grad_out[i][j].z / grad_max)/2.0f);
    }
  }
  WriteImage(outGrad, "output/grad.ppm");
  WriteImage(outGrad_x, "output/grad_x.pgm");
  WriteImage(outGrad_y, "output/grad_y.pgm");
  WriteImage(outGrad_z, "output/grad_z.pgm");

  float tensor_max[6] = {0.0f};
  for (int i = 0; i < MAX_HEIGHT; i++) {
	  for (int j = 0; j < MAX_WIDTH; j++) {
		  tensor_max[0] = fmax(tensor_max[0], fabs(tensor_out[i][j].val[0]));
		  tensor_max[1] = fmax(tensor_max[1], fabs(tensor_out[i][j].val[1]));
		  tensor_max[2] = fmax(tensor_max[2], fabs(tensor_out[i][j].val[2]));
		  tensor_max[3] = fmax(tensor_max[3], fabs(tensor_out[i][j].val[3]));
		  tensor_max[4] = fmax(tensor_max[4], fabs(tensor_out[i][j].val[4]));
		  tensor_max[5] = fmax(tensor_max[5], fabs(tensor_out[i][j].val[5]));
	  }
  }
  CByteImage outTensor0(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outTensor1(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outTensor2(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outTensor3(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outTensor4(MAX_WIDTH, MAX_HEIGHT, 1);
  CByteImage outTensor5(MAX_WIDTH, MAX_HEIGHT, 1);
  for (int i = 0; i < MAX_HEIGHT; i++) {
    for (int j = 0; j < MAX_WIDTH; j++) {
      outTensor0.Pixel(j, i, 0) = 255 * (tensor_out[i][j].val[0] / tensor_max[0]);
      outTensor1.Pixel(j, i, 0) = 255 * (tensor_out[i][j].val[1] / tensor_max[1]);
      outTensor2.Pixel(j, i, 0) = 255 * (tensor_out[i][j].val[2] / tensor_max[2]);
      outTensor3.Pixel(j, i, 0) = 255 * (0.5f + (tensor_out[i][j].val[3] / tensor_max[3])/2.0f);
      outTensor4.Pixel(j, i, 0) = 255 * (0.5f + (tensor_out[i][j].val[4] / tensor_max[4])/2.0f);
      outTensor5.Pixel(j, i, 0) = 255 * (0.5f + (tensor_out[i][j].val[5] / tensor_max[5])/2.0f);
    }
  }
  WriteImage(outTensor0, "output/tensor_XX.pgm");
  WriteImage(outTensor1, "output/tensor_YY.pgm");
  WriteImage(outTensor2, "output/tensor_ZZ.pgm");
  WriteImage(outTensor3, "output/tensor_XY.pgm");
  WriteImage(outTensor4, "output/tensor_XZ.pgm");
  WriteImage(outTensor5, "output/tensor_YZ.pgm");

		double accum_error = 0;
		int num_pix = 0;
		for (int i = 0; i < MAX_HEIGHT; i++) {
			for (int j = 0; j < MAX_WIDTH; j++) {
				double out_x = outFlow.Pixel(j, i, 0);
				double out_y = outFlow.Pixel(j, i, 1);
				if (unknown_flow(out_x, out_y)) continue;
				double out_deg = atan2(-out_y, -out_x) * 180.0 / M_PI;
				double ref_x = refFlow.Pixel(j, i, 0);
				double ref_y = refFlow.Pixel(j, i, 1);
				double ref_deg = atan2(-ref_y, -ref_x) * 180.0 / M_PI;

				// Normalize error to [-180, 180]
				double error = out_deg - ref_deg;
				while (error < -180) error += 360;
				while (error > 180) error -= 360;

				accum_error += fabs(error);
				num_pix++;
			}
		}

		double avg_error = accum_error / num_pix;
		std::cout << "Average error: " << avg_error << " degrees" << std::endl;

		return 0;
	} catch (CError& e) {
    std::cout << "error" << std::endl;
		std::cout << e.message << std::endl;
		return -1;
	}
}
