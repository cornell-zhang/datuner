//===========================================================================
// typedefs.h
//===========================================================================
// @brief: This header defines the shorthand of several ap_uint data types.

#ifndef TYPEDEFS_H
#define TYPEDEFS_H

#ifdef FIXED_TYPE
  #include "ap_fixed.h"
  typedef ap_uint<BW1> bit4;
  typedef ap_uint<BW2> bit6;
  typedef ap_uint<BW3> bit32;
  typedef ap_uint<BW4> bit64;
  typedef ap_uint<BW5> digit;
#endif

typedef float pixel_t;

typedef struct{
    pixel_t x;
    pixel_t y;
    pixel_t z;
}gradient_t;

typedef struct{
    pixel_t val[6];
}outer_t; 

typedef struct{
    pixel_t val[6];
}tensor_t;

typedef struct{
    pixel_t x;
    pixel_t y;
}velocity_t;


#endif
