# optical_flow

This is the repository for the optical flow project by Ian Thompson (ijt5), Joseph Featherston (jgf82), and Judy Stephen (jls633).

The repository is a bit of a sprawl, but has a somewhat logical organization. Our datasets are contained in the datasets folder, with a symlink to the currently active data set
There are two copies of our optical flow code, one written for Vivado HLS, one written for SDSoC. The Vivado version is contained in the top level folder, and can be built using
`vivado_hls run.tcl`, or by running the Makefile. The SDSoC version is contained in the sdsoc folder, and is the one intended for use on a ZC706 board. It can be built
using the SDSoC GUI, and uploaded to the board following the method given in the SDSoC user manual (UG1027).

To execute code on the board, a dataset will need to be uploaded. Take a folder from the datasets folder, and push it up to the board. Using sintel_alley as an example,
the following command will then run our optical flow algorithm:

./oflow_image.elf sintel_alley/frame1.ppm sintel_alley/frame2.ppm sintel_alley/frame3.ppm sintel_alley/frame4.ppm sintel_alley/frame5.ppm out.flo sintel_alley/ref.flo

The output will be created in a file out.flo, which should be downloaded from the board. Once downloaded, the .flo file can be converted to an image using a utility
in the sintel_flow_code directory. To build it, browse to sintel_flow_code/C and run the Makefile. You will need to run the Makefile in sintel_flow_code/C/imageLib beforehand.
The top-level makefile will create a program color_flow, which converts .flo files to png images. It can be run with the following command:

./color_flow out.flo out.png
