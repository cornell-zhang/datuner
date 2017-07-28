[![Build Status](https://travis-ci.com/cornell-zhang/datuner.svg?token=KrcYXzoSR4bbR5JiDUuz&branch=master)](https://travis-ci.com/cornell-zhang/datuner)

# DATuner User Guide

### Prerequisites

EDA tools (VTR and Vivado).
Make sure the tool is on your PATH.

### Compilation
(tested on zhang-05)

To build DATuner (including python, mpich and opentuner):

            % cd $HOME
            % git clone git@github.com:cornell-zhang/datuner.git
            % cd datuner
            % make -j8
            
Build time: ~18 minitues on zhang-05.
    
### Environment setup

            % cd $HOME
            % source setup.sh
       
### Enable password-less SSH between machines

 * Specify the list of machines in `$HOME/releases/Linux_x86_64/scripts/my_hosts`. The default is using zhang-05 to zhang-08.
 * Make sure you can ssh without password from the host to each other machine. *You actually need to ssh to each of the machines at least once, because the first time you ssh into a new machine, a confirmation to the command line prompt is needed. Without this, mpich will actually error out.*
  
One way to enable password-less SSH:
            
            % ssh to each machine
            % cd $HOME/releases/Linux_x86_64/scripts
            % ssh-keygen -t rsa
            % ./envset.sh

###  Tune with DATuner

  * run DATuner
  
    DATuner is an autotuner to tune EDA tool's parameters. We already support vivado and vtr. If you want to tune other EDA tools, please support the required documents. Please refer to the application part.
    
    To run DATuner:
  
            % cd $HOME/releases/Linux_x86_64/scripts/
            % ./run_DATuner.py <configuration file>

  * configuration file
    
    Under $HOME/releases/Linux_x86_64/scripts/,  we support three examples of configuration files for vivado, vtr, and user_program.

    Explaination of configuration file:

      |Name                 |Usage                                    |Values                 |Note|
      |----|----|----|----|
      |TOOL_NAME            |The name of tool to tune                 |vtr, vivado, other     |required for all tools|
      |DESIGN_NAME          |The name of design to tune               |string                 |required for all tools|
      |WORKSPACE            |The directory to save intermediate data  |absoluate path         |required for all tools|
      |TOOL_INSTALL_PATH    |Path of tools                            |absoluate path         |required only for vtr.(the path to vtr_flow directory)|
      |DESIGN_SAVE_PATH     |Path to find design                      |absoluate path         |required only for vivado|
      |TOP_MODULE           |The top module of RTL design             |string                 |required only for vivado|
      |SPACE_DEFINITION     |The search space definition file         |absoluate path         |required only for user program|
      |PYTHON_CODE          |The python code to use OpenTuner         |absoluate path         |required only for user program|
      |PROC_NUM             |The number of machines used for tuning   |integer                |optional default value: 3|
      |TEST_LIMIT           |The max number of searches to try        |interger               |optional default value: 100|
      |STOP_AFTER           |Stop DATuner when time out(s)            |integer                |optional default value: 7200(s)|
  
  * get results
  
      1) Under the $workspace/$tool/$design, we dump database and log file
      
         database: $workspace/$tool/$design/results/result.db 
      
         There is one table named "result" in the database. Inside table, it contains the following columns: id, parameters, and QoR. id is the index of configuration, which is unique and works as primary key. parameters are tool options, which are stings. QoR is the metric users want to tune, which is float type.
      
         The schema of table:
      
         |column_1|column_2|column_3|
         |----|----|----|
         |id|integer|primary key|
         |parameter_1|text|not null|
         |parameter_2|text|not null|
         |...|...|...|
         |parameter_n|text|not null|
         |QoR|float|not null|
      
         log file: tune.log. 
      
         We calculate the best found configuration and QoR in each iteration
      
      2) Visualization
  
         Under $HOME/releases/Linux_x86_64/scripts/visualization folder contains python script to plot the trace of DATuner tuning. We support plot multiple designs in one graph for comparison. Please define the series of designs you want to plot in the design list file. e.g, vivado_design.txt
     
                        % cd $HOME/releases/Linux_x86_64/scripts/visualization
                        % ./plot_design_performance.py <workspace> <design_list> <proc_num> <search_num> 
                        % <workspace>: where to find the tunning results; <design_list>: text file; <proc_num>: the number of machines used; <search_num>: the number of iterations to plot.
            
            
            
###  Applications

   * Autotest 
      
      Use auto_test flow to test whether DATuner has been successfully build 

              % cd $HOME
              % python auto_test.py

   * Tune VTR
      
      We choose to use "k6_frac_N10_mem32K_40nm.xml" (under vtr_flow/arch/timing) VTR FPGA architecture by default. If users want to use other architecture, users can modify tunevtr.py (under scripts/eda_flows/vtr). The VTR designs are saved under vtr_flow/benchmarks/verilog.

      To tune VTR, please make sure "TOOL_INSTALL_PATH" is point to vtr_flow folder in the configuration file.

              % cd $HOME/releases/Linux_x86_64/scripts
              % python run_DATuner.py configvtr.txt
   
   * Tune Vivado

      Please specify the path to design you want to run with vivado in the configuration file (DESIGN_SAVE_PATH). Inside the design folder, please support both verilog file(.v) and timing constraint(.xdc).

              % cd $HOME/releases/Linux_x86_64/scripts
              % python run_DATuner.py configvivado.txt
   
   * Tuner other programs

      
