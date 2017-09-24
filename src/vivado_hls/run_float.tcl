#=============================================================================
# run-float.tcl 
#=============================================================================
# @brief: A Tcl script for floating-point experiments.
#
# @desc: This script runs a batch of simulation & synthesis experiments
# to explore trade-offs between accuracy, performance, and area for 
# floating-point implementation of the CORDIC core.
#
# 1. The user specifies number_itertions
# 2. Results are collected in a single file ./result/float-result.csv
# 3. out.dat from each individual experiment is also copied to ./result 

#------------------------------------------------------
# You can specify a set of iteration counts to explore.
#------------------------------------------------------
set num_iterations { 5 10 20 }

#------------------------------------------------------
# run batch experiments
#------------------------------------------------------
foreach { NUM_ITER } $num_iterations {

# Define the bitwidth macros from CFLAGs
set CFLAGS "-DNUM_ITER=${NUM_ITER}"

# Project name
set hls_prj "float_iter_${NUM_ITER}.prj"

# Open/reset the project
open_project ${hls_prj} -reset
# Top function of the design is "cordic"
set_top cordic

# Add design and testbench files
add_files cordic.cpp -cflags $CFLAGS
add_files -tb cordic_test.cpp -cflags $CFLAGS

open_solution "solution1"
# Use Zynq device
set_part {xc7z020clg484-1}

# Target clock period is 10ns
create_clock -period 10

# Simulate the C++ design
csim_design
# Synthesis the design
csynth_design

#cosim_design

#---------------------------------------------
# Collect & dump out results from HLS reports
#---------------------------------------------
set filename "float_result.csv"
set argv [list $filename $hls_prj]
set argc 2
source "./script/collect_result.tcl"
}
