#==========================================================================
# Makefile
#==========================================================================
# @brief: A makefile the compiles and runs the digitrec program
#
# @desc: 1. Enter "make" to compile & execute the digitrec program
#        2. Enter "make clean" to clean up the directory (before submission)


# Extract Vivado HLS include path
#VHLS_PATH := $(dir $(shell which vivado_hls))/..
#VHLS_INC ?= ${VHLS_PATH}/include

# Specify compilation flags
#CFLAGS = -g -I${VHLS_INC} -L/opt/xilinx/xilinx_2016.2/Vivado_HLS/2016.2/lnx64/tools/fpo_v7_0 -lIp_floating_point_v7_0_bitacc_cmodel -Wl,-rpath,/opt/xilinx/xilinx_2016.2/Vivado_HLS/2016.2/lnx64/tools/fpo_v7_0

# Compile & run digitrec implementation
all: software

#hls: optical_flow.cpp optical_flow_test.cpp imageLib
#	@echo "Compiling & executing the optical flow program ..."
#	g++ ${CFLAGS} optical_flow.cpp optical_flow_test.cpp -LimageLib -lImg -lpng -o optical_flow
#	./optical_flow datasets/current/frame1.png datasets/current/frame2.png datasets/current/frame3.png datasets/current/frame4.png datasets/current/frame5.png out.flo datasets/current/ref.flo

software: optical_flow_software.cpp optical_flow_test.cpp imageLib sintel
	@echo "Compiling & executing the optical flow program ..."
	g++ ${CFLAGS} optical_flow_software.cpp optical_flow_test.cpp -L ../dependencies/imageLib -lImg -I ../dependencies/libpng/include   -L ../dependencies/libpng/lib -lpng -o optical_flow_software
	./run.sh	

.PHONY: imageLib
imageLib:
	$(MAKE) -C ../dependencies/imageLib

.PHONY: sintel
sintel: imageLib
	$(MAKE) -C ../dependencies/sintel_flow_code/C

convert: convert.cpp imageLib
	g++ ${CFLAGS} convert.cpp -LimageLib -lImg -lpng -o convert

# Clean up the directory before submission
clean:
	@echo "Clean up output files"
	rm -rf digitrec vivado_hls.log *nn.prj result out.dat *~
	$(MAKE) -C ../dependencies/imageLib clean
	$(MAKE) -C ../dependencies/sintel_flow_code/C allclean
