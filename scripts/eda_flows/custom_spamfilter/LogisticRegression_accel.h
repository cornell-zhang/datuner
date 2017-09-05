#ifndef SPAMFILTER_H
#define SPAMFILTER_H

#include <stdio.h>
#include "timer.h"
#include <math.h>
#include <getopt.h>
#include <iostream>
#include <fstream>
#include <sstream>

#include <stdlib.h>

#include <string.h>
#include <string>
#include <map>

#define NUM_FEATURES 1024
#define STEP_SIZE 60000
#define N 32

#define NUM_SAMPLES       5000
#define DATA_SET_SIZE     (NUM_FEATURES * NUM_SAMPLES)
#define NUM_TRAINING      1000
#define NUM_TESTING       (NUM_SAMPLES - NUM_TRAINING)
#define TRAINING_SIZE     (NUM_FEATURES * NUM_TRAINING)
#define TESTING_SIZE      (NUM_FEATURES * NUM_TESTING)
#define NUM_EPOCHS        5
#define MAX_NUM_EPOCHS    100
#define NUM_RUNS          1
#define CHARACTERISTIC_TIME (MAX_NUM_EPOCHS * NUM_TRAINING / 3)
#define POSITIVE_LABEL    1
#define NEGATIVE_LABEL    0

#ifndef EXIT_FAILURE
#define EXIT_FAILURE 1
#endif

// select the mode to run: SW, HW or Csim with HW
//#define HW
//#define CSIM
#define SW

//#ifndef SW
  #include <ap_int.h>
  #include <ap_fixed.h>
//#endif

#define LUTOUT_TWIDTH     12
#define LUTOUT_IWIDTH     2

#define LUTIN_TWIDTH      12
#define LUTIN_IWIDTH      4


#ifdef HW

#ifndef CSIM
 #include <sds_lib.h>
#endif

#endif
#ifdef HW
    typedef ap_fixed<32,13> FeatureType;
    typedef ap_fixed<16,4> DataType;
    typedef ap_uint<64> DataType2;
    typedef ap_uint<1> LabelType;
    typedef ap_uint<8> LabelType2;
    typedef ap_ufixed<32, 20> TmpFixed; 
    typedef ap_uint<LUTIN_TWIDTH> IdxFixed; 
    typedef ap_fixed<LUTIN_TWIDTH, LUTIN_IWIDTH> LutInFixed;
    typedef ap_fixed<LUTOUT_TWIDTH, LUTOUT_IWIDTH> LutOutFixed;

#else
    //typedef double FeatureType;
    //typedef double DataType;
    //typedef int LabelType;
    typedef ap_fixed<FEA_I,FEA_F> FeatureType;
    typedef ap_fixed<DATA_I,DATA_F> DataType;
    typedef ap_uint<DATA2_I> DataType2;
    typedef ap_uint<LABEL_I> LabelType;
    typedef ap_uint<LABEL2_I> LabelType2;

//    typedef ap_fixed<32,13> FeatureType;
//    typedef ap_fixed<16,4> DataType;
//    typedef ap_uint<64> DataType2;
//    typedef ap_uint<1> LabelType;
//    typedef ap_uint<8> LabelType2;    
    
#endif

#ifdef CSIM
#define Features_filepath "../../../../data/shuffledfeats.dat"
#define Labels_filepath "../../../../data/shuffledlabels.dat"

#else
#define Features_filepath "data/shuffledfeats.dat"
#define Labels_filepath "data/shuffledlabels.dat"
#endif

typedef std::map<std::string, double> Dictionary;


#pragma SDS data access_pattern(parameter:SEQUENTIAL, data_point:SEQUENTIAL, p_buf:SEQUENTIAL, d_buf:SEQUENTIAL)
void streamIn(
    DataType2 data_point[NUM_FEATURES/4],
    DataType d_buf[NUM_FEATURES]);

#pragma SDS data access_pattern(A:SEQUENTIAL, B:SEQUENTIAL)
FeatureType dotProduct(
    FeatureType A[NUM_FEATURES],
    DataType B[NUM_FEATURES]);

FeatureType Sigmoid(FeatureType exponent);

#pragma SDS data access_pattern(A:SEQUENTIAL, B:SEQUENTIAL)
void computeGradient(
    FeatureType A[NUM_FEATURES],
    DataType B[NUM_FEATURES],
    DataType scale_b);

#pragma SDS data access_pattern(A:SEQUENTIAL, B:SEQUENTIAL, C:SEQUENTIAL)
void updateParameter(
    FeatureType A[NUM_FEATURES],
    FeatureType B[NUM_FEATURES],
    FeatureType scale_b,
    FeatureType C[NUM_FEATURES]);

#pragma SDS data access_pattern(para_stored:SEQUENTIAL, para_out:SEQUENTIAL)
void streamOut(
    FeatureType para_stored[NUM_FEATURES],
    FeatureType para_out[NUM_FEATURES]);

//#pragma SDS data mem_attribute(data:NON_CACHEABLE|PHYSICAL_CONTIGUOUS, theta:CACHEABLE|PHYSICAL_CONTIGUOUS)
#pragma SDS data mem_attribute(data:NON_CACHEABLE|PHYSICAL_CONTIGUOUS, label:CACHEABLE|PHYSICAL_CONTIGUOUS, theta:CACHEABLE|PHYSICAL_CONTIGUOUS)
#pragma SDS data data_mover(data:AXIDMA_SG, label:AXIFIFO, theta:AXIDMA_SG)
#pragma SDS data sys_port(data:AFI, label:AFI, theta:AFI)
#pragma SDS data zero_copy(theta[0:1024])
#pragma SDS data copy(data[0:TRAINING_SIZE/4])  //, theta[0:1024])
#pragma SDS data zero_copy(label[0:NUM_TRAINING/8])
#pragma SDS data access_pattern(data:SEQUENTIAL, label:SEQUENTIAL, theta:SEQUENTIAL) 
int logisticreg_accel(DataType2 data[NUM_FEATURES * NUM_TRAINING / 4],
    LabelType2   label[NUM_TRAINING/8],
    int last,
    int num_training,
    FeatureType theta[NUM_FEATURES]);

#endif
