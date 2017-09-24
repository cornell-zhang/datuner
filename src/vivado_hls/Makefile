#==========================================================================
# Makefile
#==========================================================================
# @brief: A makefile the compiles and runs the cordic program
#
# @desc: 1. "make float" compiles & executes the floating-point implementation
#        2. "make fixed" compiles & executes the fixed-point implementation
#        3. "make clean" cleans up the directory

# Extract Vivado HLS include path
VHLS_PATH := $(dir $(shell which vivado_hls))/..
VHLS_INC ?= ${VHLS_PATH}/include

# default runs floating-point implementation
all: float

# compile & run floating-point implementation
float: cordic.h cordic.cpp cordic_test.cpp
	@echo "Compiling & executing floating-point implementation ..."
	g++ -g -I${VHLS_INC} cordic.cpp cordic_test.cpp -o cordic 
	./cordic
 
# compile & run fixed-point implementation
fixed: cordic.h cordic.cpp cordic_test.cpp
	@echo "Compiling & executing fixed-point implementation ..."
	g++ -g -I${VHLS_INC} cordic.cpp cordic_test.cpp -o cordic -DFIXED_TYPE
	./cordic

# Clean up the directory before submission
clean:
	@echo "Clean up output files"
	rm -rf result *.prj *.log *.dat cordic
