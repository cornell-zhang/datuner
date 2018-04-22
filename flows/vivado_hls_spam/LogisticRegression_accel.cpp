#include "LogisticRegression_accel.h"
#include "lut.h"

// The function logisticreg_accel reads the data passed to the functions into local buffers d_buf and p_buf (required to be able to apply pragmas such as array partition). Dot product is computed for d_buf and p_buf which is then applied to logistic function (or Sigmoid function) to calculate the probability of the training sample of being a spam or ham. The gradient of the hypothesis is calculated using probability and label of the sample and 


//Function to read the data passed to the logisticreg_accel into local buffers. This is required to be able to use pragmas such as array_partition
void streamIn(
    DataType2 data_point[NUM_FEATURES/4],
    DataType d_buf[NUM_FEATURES])
{
   #pragma HLS INLINE
   // Features and parameters are read into d_buf and p_buf respectively
   for (int i = 0; i < NUM_FEATURES / 4; i++){
        #pragma HLS PIPELINE II=1
        d_buf[4*i].range(15,0) = data_point[i].range(63,48);
        d_buf[4*i+1].range(15,0) = data_point[i].range(47,32);
        d_buf[4*i+2].range(15,0) = data_point[i].range(31,16);
        d_buf[4*i+3].range(15,0) = data_point[i].range(15,0);
   }
}

// Function to compute the dot product of data (feature) vector and parameter vector
FeatureType dotProduct(
    FeatureType A[NUM_FEATURES],
    DataType B[NUM_FEATURES])
{
    #pragma HLS INLINE
    // array partition to enable parallel computation of dot product
    #pragma HLS array_partition variable=A cyclic factor=32
    #pragma HLS array_partition variable=B cyclic factor=32
    
    FeatureType result = 0;
    for (int i = 0; i < N; i++){
        #pragma HLS PIPELINE II=1
        for(int j = 0; j < N; j++) {
            FeatureType term = A[i*N+j] * B[i*N+j];
            result += term;
        }
    }
    return result;
}


FeatureType useLUT(FeatureType in) { 

    #pragma HLS INLINE
    IdxFixed index;
    if (in < 0){
        in = -in;
        index = (IdxFixed)LUT_SIZE - (IdxFixed)(((TmpFixed)in) << (LUTIN_TWIDTH - LUTIN_IWIDTH));  
    } else {
        index = ((TmpFixed)in) << (LUTIN_TWIDTH - LUTIN_IWIDTH);  
    }
    return lut[index];
}

// Function to compute the probability. The Sigmoid function is implemented using BRAMS 
// to store the value of Sigmoid function for values relevant to this application
FeatureType Sigmoid(FeatureType exponent) {

    #pragma HLS INLINE
    if (exponent > 4) {
        return 1.0;
    } else if (exponent < -4) {
        return 0.0;
    } else {
        LutInFixed inLut = (LutInFixed)exponent;
        return useLUT(inLut);
    } 
}

// Compute the gradient of the cost function

void computeGradient(
    FeatureType A[NUM_FEATURES],
    DataType B[NUM_FEATURES],
    DataType scale_b)
{
    #pragma HLS INLINE
    #pragma HLS array_partition variable=A cyclic factor=32
    #pragma HLS array_partition variable=B cyclic factor=32
    for (int i = 0; i < N; i++){
        #pragma HLS PIPELINE II=1
        for (int j = 0; j < N; j++){
            A[i*N+j] = (scale_b * B[i*N+j]);
        }
    }
}

// Update the parameter vector
void updateParameter(
    FeatureType A[NUM_FEATURES],
    FeatureType B[NUM_FEATURES],
    FeatureType scale_b)
{
    #pragma HLS INLINE
    #pragma HLS array_partition variable=A cyclic factor=32
    #pragma HLS array_partition variable=B cyclic factor=32
    for (int i = 0; i < N; i++){
        #pragma HLS PIPELINE II=1
        for (int j = 0; j < N; j++){
            A[i*N+j] += (scale_b * B[i*N+j]);
        }
    }
}

// Write back the value to the theta vector passed to the logisticreg_accel function
void streamOut(
    FeatureType para_stored[NUM_FEATURES],
    FeatureType para_out[NUM_FEATURES])
{
    #pragma HLS INLINE
    for (int i = 0; i < NUM_FEATURES; i++){
       #pragma HLS PIPELINE II=1
       para_out[i] = para_stored[i];
    }
}

// top-level wrapper for dataflow
void compute(DataType d_buf[NUM_FEATURES], LabelType2 LABEL, FeatureType theta_stored[NUM_FEATURES])
{
  FeatureType gradient[NUM_FEATURES];
  FeatureType prob;
  FeatureType step = STEP_SIZE;
 
  FeatureType dot = dotProduct(theta_stored,d_buf);
  prob = Sigmoid(dot);
  computeGradient(gradient, d_buf, (prob-LABEL));
  updateParameter(theta_stored, gradient, -step);

}

int logisticreg_accel( DataType2 data[NUM_FEATURES * NUM_TRAINING / 4],
    LabelType2   label[NUM_TRAINING/8],
    int last,
    int num_training,
    FeatureType theta[NUM_FEATURES])
{

    FeatureType static theta_stored[NUM_FEATURES];
    DataType d_buf[NUM_FEATURES];
    LabelType2 LabelCollect = 0;
    
    for (int i = 0; i < num_training; i+=8) {
        LabelCollect = label[i/8];
        for( int j =0; j < 8; j++ ){  
            #pragma HLS dataflow
            streamIn(data + (i+j) * NUM_FEATURES / 4,d_buf); 
            compute(d_buf, LabelCollect[7-j], theta_stored);
        }
    }

    
   if (last == 1)
     streamOut(theta_stored, theta); 

   return 1;
}
