#=============================================================================
# run-fixed.tcl 
#=============================================================================
# @brief: A Tcl script for fixed-point experiments.
#
# @desc: This script runs a batch of simulation & synthesis experiments
# to explore trade-offs between accuracy, performance, and area for 
# fixed-point implementation of the CORDIC core.
#
# 1. The user specifies a list of bitwidth pairs, i.e., (TOT_WIDTH, INT_WIDTH)
# 2. Results are collected in a single file ./result/fixed-result.csv
# 3. out.dat from each individual experiment is also copied to ./result

#-----------------------------------------------------
# You can specify a set of bitwidth configurations to 
# explore in the batch experiments. 
# Each configuration (line) is defined by a pair in  
# total bitwidth and integer bitwidth
#-----------------------------------------------------

#-----------------------------------
# run batch experiments
#-----------------------------------
set srcdir "./cordic.prj"
set hls_log "./vivado_hls.log"
# Clean up the files of previous run
exec rm -rf $srcdir
#exec rm -f $hls_log

# Define the bitwidth macros from CFLAGs
source ./options.tcl

# Project name
set hls_prj "cordic.prj"

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
# Synthesize the design
csynth_design

export_design -evaluate verilog
# We will skip C-RTL cosimulation for now
#cosim_design

#---------------------------------------------
# Collect & dump out results from HLS reports
#---------------------------------------------
#set filename "fixed_result.csv"
#set argv [list $filename $hls_prj]
#set argc 2
#source "./script/collect_result.tcl"

