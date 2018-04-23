[![CircleCI](https://circleci.com/gh/cornell-zhang/datuner/tree/master.svg?style=svg)](https://circleci.com/gh/cornell-zhang/datuner/tree/master)

# DATuner User Guide

## Publication

If you use DATuner in your research, please cite [our FPGA'17 paper](http://www.csl.cornell.edu/~zhiruz/pdfs/datuner-fpga2017.pdf):

```
@article{xu-datuner-fpga2017,
  title   = "{A Parallel Bandit-Based Approach for Autotuning FPGA Compilation}",
  author  = {Chang Xu and Gai Liu and Ritchie Zhao and Stephen Yang and Guojie Luo and Zhiru Zhang}
  journal = {Int'l Symp. on Field-Programmable Gate Arrays (FPGA)},
  month   = {Feb},
  year    = {2017},
} 
```

## Supported Platfroms and EDA Tools

DATuner has been tested on CentOS and Ubuntu; and it supports VTR, Vivado, Quartus, and custom flows. Please make sure the tool is on your PATH.

## Installation

To build DATuner (including python, dispy, and opentuner):

```
$ git clone git@github.com:cornell-zhang/datuner.git
$ cd datuner
$ make -j4
```
            
## Environment Setup

Please add the following to your BASH. And please make sure the tool you are tuning (e.g. Quartus, Vivado) is on your PATH.

```
unalias python 2>/dev/null
export DATUNER_HOME=*path_to_the_directory_where_datuner_is_installed*/datuner
export PATH=$DATUNER_HOME/src:$PATH
export PATH=$DATUNER_HOME/releases/Linux_x86_64/install/bin:$PATH
export LD_LIBRARY_PATH=$DATUNER_HOME/releases/Linux_x86_64/install/lib:$LD_LIBRARY_PATH
```   
    
## Running DATuner

1. Copy the corresponding Python template from $DATUNER\_HOME/cfg to the directory where DATuner will be called (DATuner can be called from any directory). The template includes design and environment variables such as the parameters to be tuned (i.e. the search space), design path, list of worker machines, and the workspace path (i.e. the directory where the worker machines operate on). For Quartus and Vivado, the configuration file also includes top module and target device. The provided Quartus and Vivado flags should not be renamed. For VTR, tool path should be specified in the configuration file. Please refer to the Applications section below for more details.

2. Run DATuner with the following command:
  
   `$ datuner.py -f [vtr|vivado|quartus|custom] -b [budget] -t [timeout] -p [parallelization_factor]`

   Here, f stands for flow, b for maximum number of executions, t for stop time, and p for the process number. Timeout should be a string with the following format: [#]d:[#]h:[#]m:[#]s. The ordering of the time units can be changed, and any time unit can be omitted if it has zero value. Example usage: 

   `$ datuner.py -f quartus -b 100 -t 1d:1h:20m:10s -p 2`

   If the arguments b, t, or p are omitted from the command, their default values will be assumed (i.e. 1 for b, 0.0d:0.0h:0.0m:7200.0s for t, and 1 for p).

## Results
  
The results database results.db is created under the directory where DATuner has been called. The table inside this database includes the parameters and the quality of results (QoR) obtained. The optimal parameter configurations and QoR are written to global\_result.txt under the directory where DATuner has been called.

##  Applications

   * Tuning VTR

     The default VTR FPGA architecture is "k6_frac_N10_mem32K_40nm.xml". If users want to use another architecture, tune.py (under $DATUNER_HOME/flows/vtr) can be modified accordingly.
   
   * Tuning Vivado

     Inside the design folder, please provide both Verilog file (.v) and the timing constraint (.xdc).

   * Tuning Quartus

     Inside the design folder, please provide both Verilog file (.v) and the timing constraint (.sdc).

   * Tuning other programs (i.e. custom flow)
     
## License
DATuner is offered under the terms of the Open Source Initiative BSD 3-Clause License. More information about this license can be found here:
 - http://choosealicense.com/licenses/bsd-3-clause
 - http://opensource.org/licenses/BSD-3-Clause
