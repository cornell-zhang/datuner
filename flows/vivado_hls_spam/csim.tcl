#=============================================================================
# run.tcl
#=============================================================================
# @brief: A Tcl script for C simulation of the face-detection design

set srcdir "./hls.prj"
# Clean up the file of previous run
exec rm -rf $srcdir

# Set flags
source ./options.tcl

# Open/reset the project
open_project hls.prj -reset

# Top function of the design is "haar"
set_top logisticreg_accel

# Add design and testbench files
add_files -tb LogisticRegression.cpp -cflags $CFLAGS
add_files LogisticRegression_accel.cpp -cflags $CFLAGS


open_solution solution
 
# Use Zynq device
# zc-706
set_part xc7z045ffg900-2

config_rtl -reset state

# Simulate the C++ design
csim_design

# Synthsis the design
csynth_design

export_design -evaluate verilog

# Co-simulate the design
# cosim_design

exit
