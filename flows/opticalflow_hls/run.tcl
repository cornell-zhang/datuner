#=============================================================================
# run.tcl 
#=============================================================================
# @brief: A Tcl script for synthesizing the digit recongnition design.
#
# @desc: This script launches a batch of simulation & synthesis runs
# to quickly explore different K parameters.
#
# 1. The user specifies the list of K values.
# 2. Useful simulation & synthesis stats are consolidated into ./result/result.csv


# Define the bitwidth macros from CFLAGs
set CFLAGS ""

# Project name
set hls_prj o_flow.prj

# Open/reset the project
open_project ${hls_prj} -reset
# Top function of the design is "digitrec"
set_top optical_flow

# Add design and testbench files
add_files optical_flow.cpp -cflags $CFLAGS
add_files -tb "optical_flow_test.cpp imageLib/Convert.cpp imageLib/Convolve.cpp imageLib/flowIO.cpp imageLib/Image.cpp imageLib/ImageIO.cpp imageLib/ImageIOpng.cpp imageLib/RefCntMem.cpp" -cflags "-lpng" 
add_files -tb datasets

open_solution "solution1"
# Use Zynq device
set_part {xc7z045ffg900-2}

# Target clock period is 10ns
create_clock -period 10

# Setup the Outpu Dir
set output_dir "./o_flow.prj/solution1/csim/build/output"
file mkdir $output_dir

# Setup the Flags
source ./options.tcl

# Simulate the C++ design
csim_design -argv "datasets/current/frame1.ppm datasets/current/frame2.ppm datasets/current/frame3.ppm datasets/current/frame4.ppm datasets/current/frame5.ppm out.flo datasets/current/ref.flo"
# Synthesize the design
csynth_design
export_design -evaluate verilog
# Co-simulate the design
cosim_design -argv "datasets/current/frame1.ppm datasets/current/frame2.ppm datasets/current/frame3.ppm datasets/current/frame4.ppm datasets/current/frame5.ppm out.flo datasets/current/ref.flo" -trace_level all

exit
#---------------------------------------------
# Collect & dump out results from HLS reports
#---------------------------------------------
set filename "oflow_result.csv"
set argv [list $filename $hls_prj]
set argc 2
