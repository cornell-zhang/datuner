# DATuner User Guide

###  Required package

Python2.7 

OpenTuner: http://opentuner.org/

Mpich3.2 https://www.mpich.org/ 

### Running on multiple hosts:
####  SSH login without password 
http://blog.csdn.net/educast/article/details/7174498

####  Make sure programs can run across multiple hosts
https://www.open-mpi.org/faq/?category=running#diagnose-multi-host-problems 

(11. How can I diagnose problems when running across multiple hosts?)

###  Run DATuner
Note: DATuner now can support tuning VPR and Vivado. 
DATuner will support other applications by extending the interface later.

####  Compilation
Go into PathTo-DATuner/parTuner directory

#####  In Makefile, replace MY_TOOLS_INCL with your python path and the include folder of mpich

#####  Modify part of MY_TOOLS_LDFLAGS to point to the lib folder of mpich

#####  Add mpich to PATH

#####  Type make, which generates master.exe and worker.exe under bin directory.

####  Evaluation
Go into PathTo-DATune/evaluation directory

Under scripts directory, please specify the list of multiple machines that DATuner runs on in my_hosts file 

#####  Tune VPR

First install VTR https://github.com/verilog-to-routing/vtr-verilog-to-routing 

 ./runonevpr.sh <design_name>
 
 e.g., ./runonevpr.sh diffeq1

In runonevpr.sh, please replace path with the workspace that you want to run experiment. 
And replace vprpath with the path that you install vpr.
The output file will be saved in your workspace_path/vpr/daTuner/diffeq1
Result_1~8 is the samples found by OpenTuner1~8. 
I have script to pass and visualize the result. Will upload later.

#####  Tune Vivado

First make sure Vivado is installed on every machine that you run DATuner
./runonevivado.sh <design_name> <0|1> 0 means you don’t want to tune the default timing constraint. 
1 means default timing constraint is also a parameter to tune. 
If you want to tune the default timing constraint, 
please specify the default timing constraint (mydefaultcst) 
and the amount of time you want to relax (maxcst). 
For example, if you set mydefaultcst=2 and maxcst=0.5, 
DATuner will choose the timing constraint from [1.7-2.5].
In runonevivado.sh, please replace path with the workspace that you want to run experiment. 
And replace designpath with the path where saves the test benches. 
Also the output file will be saved in your workspace_path/vivado/daTuner/diffeq1. 
Please make sure that under your design path, 
you have .xdc file which is the timing constraint file and you have run_vivado.tcl file.
