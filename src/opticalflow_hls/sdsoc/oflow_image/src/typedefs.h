//===========================================================================
// typedefs.h
//===========================================================================
// @brief: This header defines the shorthand of several ap_uint data types.

#ifndef TYPEDEFS_H
#define TYPEDEFS_H

//#include "ap_fixed.h"

//typedef ap_uint<4> bit4;
//typedef ap_uint<6> bit6;
//typedef ap_uint<32> bit32;
//typedef ap_uint<64> bit64;
//typedef ap_uint<49> digit;

typedef float pixel_t;

typedef struct{
    pixel_t x;
    pixel_t y;
    pixel_t z;
}gradient_t;

typedef struct{
	pixel_t val_0;
	pixel_t val_1;
	pixel_t val_2;
	pixel_t val_3;
	pixel_t val_4;
	pixel_t val_5;
}outer_t;

typedef struct{
	pixel_t val_0;
	pixel_t val_1;
	pixel_t val_2;
	pixel_t val_3;
	pixel_t val_4;
	pixel_t val_5;
}tensor_t;


#endif
