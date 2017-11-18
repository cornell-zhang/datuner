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

#pragma SDS data access_pattern(frame1:SEQUENTIAL, frame2:SEQUENTIAL, frame3:SEQUENTIAL, frame4:SEQUENTIAL, frame5:SEQUENTIAL, output_x:SEQUENTIAL, output_y:SEQUENTIAL)
void optical_flow(pixel_t frame1[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame2[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame3[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame4[MAX_HEIGHT][MAX_WIDTH],
    pixel_t frame5[MAX_HEIGHT][MAX_WIDTH],
    pixel_t output_x[MAX_HEIGHT][MAX_WIDTH],
    pixel_t output_y[MAX_HEIGHT][MAX_WIDTH]);


#endif
