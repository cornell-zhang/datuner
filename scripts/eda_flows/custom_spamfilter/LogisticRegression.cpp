#include "LogisticRegression_accel.h"


/* Testbench to read in the data from the data points and label file defined in LogisticRegression_accel.h. Once data is read into variables, one training sample is sent to the accelerator to compute gradient and update the parameters. The model is trained for NUM_TRAINING samples for NUM_EPOCHS times. Testing is done for NUM_SAMPLES - NUM_TRAINING samples. Once training is done, testing is done for the testing samples using the parameter vector updated by the accelerator using training samples. */

//************************************************************************//
// Function to calculate dot product of data(features) and parameters
FeatureType SW_dotProduct(
    FeatureType A[NUM_FEATURES],
    DataType2 B[NUM_FEATURES/4])
{
    FeatureType result = 0;
    DataType val = 0;
    for (int i = 0; i < NUM_FEATURES; i+=4){
        for(int j = 0; j < 4; j++){
            switch(j){
                case 0 : val = B[i/4].range(63,48);break;
                case 1 : val = B[i/4].range(47,32);break;
                case 2 : val = B[i/4].range(31,16);break;
                case 3 : val = B[i/4].range(15,0);break;
            }
            result += (val*A[i+j]);
        }
    }
    return result;
}


// Function to calculate the sigmoid or logistic value of the probability of the dot product
FeatureType SW_Sigmoid(FeatureType exponent) {

  return (1.0 / (1.0 + exp((float) (-exponent))));
}

//Function to compute the gradient of the cost function
void SW_computeGradient(
    FeatureType A[NUM_FEATURES],
    DataType2 B[NUM_FEATURES/4],
    FeatureType scale_b)
{
    DataType val = 0;
    for (int i = 0; i < NUM_FEATURES; i+=4){
        for(int j = 0; j < 4; j++){
            switch(j){
                case 0 : val = B[i/4].range(63,48);break;
                case 1 : val = B[i/4].range(47,32);break;
                case 2 : val = B[i/4].range(31,16);break;
                case 3 : val = B[i/4].range(15,0);break;
            }
            A[i+j] = (scale_b * val);
        }
    }
}


//Update the parameter vector

void SW_updateParameter(
    FeatureType A[NUM_FEATURES],
    FeatureType B[NUM_FEATURES],
    FeatureType scale_b)
{
    for (int i = 0; i < NUM_FEATURES; i++){
        A[i] += (scale_b * B[i]);
    }
}

// Function to calculate and update the parameter vector using features of each training sample
void SW_logisticRegression(
    DataType2 data[TRAINING_SIZE/4],
    LabelType2   label[NUM_TRAINING/8],
    FeatureType step,
    FeatureType theta[NUM_FEATURES])
{

    FeatureType static theta_stored[NUM_FEATURES];
    FeatureType gradient[NUM_FEATURES];
    FeatureType prob;
    unsigned char LABEL = 0;
    for(int j = 0; j < NUM_TRAINING; j+=8){
        for(int i = 0; i < 8; i++){
            // Calculate dot product and probability
            prob = SW_Sigmoid(SW_dotProduct(theta_stored,data + ( j + i ) * NUM_FEATURES / 4));
            // calculate the gradient 
            LABEL = label[j/8].range(7-i,7-i);
            SW_computeGradient(gradient, data + ( j + i ) * NUM_FEATURES / 4, (prob-LABEL));
            // Update the parameter
            SW_updateParameter(theta_stored, gradient, -step); 
        
            for (int k = 0; k < NUM_FEATURES; k++){
                theta[k] = theta_stored[k];
                //if(theta_stored[k] != 0) 
                //   for( int jj = 0; jj < NUM_FEATURES; jj++ )
                //       printf("prameter[%d]:%s  \n", jj, (theta_stored[jj]).to_string().c_str());
            }
        }
    }
}

/************************************************************************************/
// Function to read the feature values for each training sample from the file shuffledfeats.dat (defined in LogisticRegression_accel.h
size_t readData(
    size_t total_size,
    size_t train_size,
    const char* file_name,
    DataType2* train_set,
    DataType* test_set)
{
    std::ifstream source_file;
    source_file.open(file_name);
    if (!source_file.is_open()) {
        std::cerr << "Failed to open file " << file_name << std::endl;
        return 0;
    }
    size_t i = 0;
    DataType val = 0;
    for ( val = 0; i < train_size; i+=4 ){
        for(int j = 0; j < 4; j++){
            if( !( source_file >> val ) )
                break;
            switch(j){
                case 0 : train_set[i/4].range(63,48) = val.range(15,0);break;
                case 1 : train_set[i/4].range(47,32) = val.range(15,0);break;
                case 2 : train_set[i/4].range(31,16) = val.range(15,0);break;
                case 3 : train_set[i/4].range(15,0) = val.range(15,0);break;
            }
        }
    }
    for ( val = 0; i < total_size && source_file >> val; i++ )
        test_set[i-train_size] = val;

    source_file.close();
    std::cout << "Finished reading " << i << " lines of " << file_name << "\n";
    return i;
}

// Function to read the feature values for each training sample from the file shuffledlabels.dat (defined in LogisticRegression_accel.h
size_t readLabel(
    size_t total_size,
    size_t train_size,
    const char* file_name,
    LabelType2* train_set,
    LabelType* test_set)
{
    std::ifstream source_file;
    source_file.open(file_name);
    if (!source_file.is_open()) {
        std::cerr << "Failed to open file " << file_name << std::endl;
        return 0;
    }
    size_t i = 0;
    LabelType val = 0;
    for ( val = 0; i < train_size; i+=8 ){
        for( int j = 0; j < 8; j++ ){
            if( !(source_file >> val) )
                break;
            train_set[i/8].range(7-j,7-j) = val.range(0,0);
        }
    }
    for ( val = 0; i < total_size && source_file >> val; i++ )
        test_set[i-train_size] = val;

    source_file.close();
    std::cout << "Finished reading " << i << " lines of " << file_name << "\n";
    return i;
}

// Function to predict whether the particular sample is spam or ham
LabelType getPrediction(
    FeatureType* parameter_vector,
    DataType* data_point)
{
    FeatureType result = 0;
    for (int j = 0; j < NUM_FEATURES; j++){
        result += parameter_vector[j] * data_point[j];
    }
    return
        (result > 0)? POSITIVE_LABEL : NEGATIVE_LABEL;
}

// Compute the error rate for testing sample using parameter vector updated by training samples
double computeErrorRate(
    FeatureType *Parameter_Trained,
    DataType *Testing_Points,
    LabelType *Testing_Labels,
    Dictionary* errors)
{
    DataType data_point[NUM_FEATURES];

    size_t true_positives = 0, true_negatives = 0,
        false_positives = 0, false_negatives = 0;
    // read the testing samples in the array data_point
    for (size_t i = 0; i < NUM_TESTING; i++) {
        for (size_t j = 0; j < NUM_FEATURES; j++){
            data_point[j] = Testing_Points[i * NUM_FEATURES + j];
        }
        // get the prediction
        LabelType prediction = getPrediction(Parameter_Trained,data_point);
        // If the prediction is incorrect, determine whether it's a false positive or false negative
        if (prediction != Testing_Labels[i]){
            if (prediction == POSITIVE_LABEL)
                false_positives++;

            else
                false_negatives++;
        }
        // If the prediction is correct, determine whether it's a true positive or true negative
        else {
            if (prediction == POSITIVE_LABEL)
                true_positives++;
            else
                true_negatives++;
        }
    }
    // compute the error rates
    double error_rate =
        (double) (false_positives + false_negatives) / (NUM_SAMPLES-NUM_TRAINING);
    if (errors) {
        (*errors)["tpr"]
            += (double)true_positives / (true_positives + false_negatives);
        (*errors)["fpr"]
            += (double)false_positives / (false_positives + true_negatives);
        (*errors)["error"]
            += error_rate;
    }
    return error_rate;
}

// Initial the struct error rate
void initErrorDict(Dictionary* dict) {
    (*dict)["tpr"] = 0.0;
    (*dict)["fpr"] = 0.0;
    (*dict)["error"] = 0.0;
}

// Convert the error rates to percentage
void scaleErrorDict(Dictionary* dict, float factor) {
    (*dict)["tpr"] *= factor;
    (*dict)["fpr"] *= factor;
    (*dict)["error"] *= factor;
}


//Function to train the model: for NUM_EPOCH of times, send each training sample to the accelerator and update the parameter.
double trainSGD(
    FeatureType *parameter,
    DataType2 *points,
    LabelType2 *labels)
{
    FeatureType step_size = STEP_SIZE;
    int flag = 0;
    FeatureType annealed_step = step_size;
    
    // start the timer to compute the actual execution time spent in the accelerator
    Timer training_timer;
    training_timer.start();
    for (int k = 0; k < NUM_EPOCHS; k++) {
       	if ( k ==  NUM_EPOCHS - 1 ) 
            flag = 1; 
        else 
            flag = 2;
        #ifdef HW
        SW_logisticRegression( points, labels, annealed_step, parameter );
        //logisticreg_accel( points, labels, flag, NUM_TRAINING, parameter );
        #else
        SW_logisticRegression( points, labels, annealed_step, parameter );
        #endif    
    }

    training_timer.stop();
    return (training_timer.totalTime/training_timer.nCalls);
}

double trainAndTest(
    const char* name,
    FeatureType *Parameter_Trained,
    DataType2 *Training_Points,
    LabelType2 *Training_Labels,
    DataType *Testing_Points,
    LabelType *Testing_Labels)
{
    double training_time = 0.0;
    Dictionary test_errors;
    initErrorDict(&test_errors);

    printf("Training ...\n");

    for (size_t k = 0; k < NUM_RUNS; k++) {
 
        // initialize the parameter vector to zeros
        for (size_t i = 0; i < NUM_FEATURES; i++)
            Parameter_Trained[i] = 0;
        
        // logic to train the model
        training_time=    trainSGD(Parameter_Trained,Training_Points,Training_Labels);
        computeErrorRate(Parameter_Trained,Testing_Points,Testing_Labels,&test_errors);
    }

    training_time = 1000 * training_time;
    scaleErrorDict(&test_errors, 100.0 / NUM_RUNS);

    printf("%s", "name,runs,time,Test TPR, Test FPR,Test Error\n");
    printf( "%s, %d, %4.2f, %2.2f, %2.2f, %2.2f\n",
            "sgd",
            NUM_RUNS,
            training_time,
            test_errors["tpr"],
            test_errors["fpr"],
            test_errors["error"]);
    printf("some string to be written\n");
    std::ofstream output_ftr("result.txt");
    output_ftr<<test_errors["error"]<<std::endl;
    output_ftr<<std::flush;
    output_ftr.close();
    return training_time;
}


int main(){
 
    DataType2 *Training_Points; 
    DataType *Testing_Points;
    FeatureType *Parameter_Trained;
    LabelType2 *Training_Labels;
    LabelType *Testing_Labels;
    Testing_Points = (DataType *)malloc(TESTING_SIZE * sizeof(DataType));
    Testing_Labels = (LabelType *)malloc(NUM_TESTING * sizeof(LabelType));

   // Execute only if HW is defined
    #ifdef HW
        printf("running hardware design.\n");
        #ifndef CSIM
        Parameter_Trained = (FeatureType *)sds_alloc(NUM_FEATURES * sizeof(FeatureType));
        Training_Points = (DataType2 *)sds_alloc_non_cacheable(TRAINING_SIZE / 4 * sizeof(DataType2));
        Training_Labels = (LabelType2 *)sds_alloc(NUM_TRAINING / 8 * sizeof(LabelType2));

        if (!Parameter_Trained || !Training_Points || !Training_Labels) {
          if (Parameter_Trained) sds_free(Parameter_Trained);
          if (Training_Points) sds_free(Training_Points);
          if (Training_Labels) sds_free(Training_Labels);
          return 2;
        }
       #else
        Parameter_Trained = (FeatureType *)malloc(NUM_FEATURES * sizeof(FeatureType));
        Training_Points = (DataType2 *)malloc(TRAINING_SIZE / 4 * sizeof(DataType2));
        Training_Labels = (LabelType2 *)malloc(NUM_TRAINING / 8 * sizeof(LabelType2));
         
       #endif

    #else 
        printf("running software design.\n");
        Parameter_Trained = (FeatureType *)malloc(NUM_FEATURES * sizeof(FeatureType));
        Training_Points = (DataType2 *)malloc(TRAINING_SIZE / 4 * sizeof(DataType2));
        Training_Labels = (LabelType2 *)malloc(NUM_TRAINING / 8 * sizeof(LabelType2));
    #endif

    // read the features and labels into variables
    printf("loading...\n");
    if( readData(DATA_SET_SIZE,TRAINING_SIZE,Features_filepath,
        Training_Points,Testing_Points) != DATA_SET_SIZE )
        return EXIT_FAILURE;

    if( readLabel(NUM_SAMPLES,NUM_TRAINING,Labels_filepath,
        Training_Labels,Testing_Labels) != NUM_SAMPLES )
        return EXIT_FAILURE;

    printf("data loading finished.\n");
    trainAndTest("sgd",Parameter_Trained,Training_Points,Training_Labels,Testing_Points,Testing_Labels);

    // free up the memory
    #ifdef HW
        #ifndef CSIM
        sds_free(Parameter_Trained);
        sds_free(Training_Points);
        sds_free(Training_Labels);
        #else
        free(Parameter_Trained);
        free(Training_Points);
        free(Training_Labels);
        #endif
    #else
        free(Parameter_Trained);
        free(Training_Points);
        free(Training_Labels);
    #endif

    free(Testing_Points);
    free(Testing_Labels);

    return 0;
}
