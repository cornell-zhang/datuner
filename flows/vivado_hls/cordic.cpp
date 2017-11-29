//=========================================================================
// cordic.cpp
//=========================================================================
// @brief : A CORDIC implementation of sine and cosine functions.

#include "cordic.h"
#include <math.h>

#include <iostream>

//-----------------------------------
// cordic function
//-----------------------------------
// @param[in]  : theta - input angle
// @param[out] : s - sine output
// @param[out] : c - cosine output
void cordic(theta_type theta, sin_type &s, cos_type &c)
{
    // -----------------------------
    // YOUR CODE GOES HERE
    // -----------------------------

    // normalization constant    
    double K_const = 0.6072529350088812561694;
    
    theta_type current;
    cos_type X, T;
    sin_type Y;
    int step;
    int i;
    X = K_const;
    Y = 0;
    current = 0;

    // using fixed point 
#ifdef FIXED_TYPE 
    //for ( step = 0; step < 20; step++ ) { 
    //    bool mode = (theta > current);
    //    cos_sin_type sub_op_0, sub_op_1, sub_res;
    //    cos_sin_type add_op_0, add_op_1, add_res;
    //    cos_type X_shl = X >> step;
    //    sin_type Y_shl = Y >> step;
    //    sub_op_0 = mode ? X : Y;
    //    sub_op_1 = mode ? (Y_shl) : (X_shl);
    //    add_op_0 = mode ? (X_shl) : X;
    //    add_op_1 = mode ? Y : (Y_shl);

    //    sub_res = sub_op_0 - sub_op_1;
    //    add_res = add_op_0 - add_op_1;

    //    T = mode ? sub_res : add_res;
    //    Y = mode ? add_res : sub_res;

    //    X = T;

    //    if (mode)
    //        current = current + cordic_ctab[step];
    //    else
    //        current = current - cordic_ctab[step];
   // }
    
    for ( step = 0; step < 20; step++ ) { 
        if (theta > current) { 
            T = X - ( Y >> step );
            Y = ( X >> step ) + Y;
            X = T;
            current = current + cordic_ctab[step];
        }
  	    else {
            T = X + ( Y >> step );
            Y = -( X >> step ) + Y;
            X = T;
            current = current - cordic_ctab[step];
        }
    }
#else //using floating point
    
    for ( step = 0; step < NUM_ITER; step++ ) { 
  	if (theta > current) { 
            T = X - ( Y / (double)(1ULL << step) );
            Y = ( X / (double)(1ULL << step) ) + Y;
            X = T;
            current = current + cordic_ctab[step];
        }
  	else {
            T = X + ( Y / (double)(1ULL << step) );
            Y = -( X / (double)(1ULL << step) ) + Y;
            X = T;
            current = current - cordic_ctab[step];
        }
    }
#endif
    
    s = Y;
    c = X;
}
