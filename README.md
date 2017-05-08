# DATuner User Guide

### Prerequisites

OpenTuner: http://opentuner.org/tutorial/setup/

###  Compilation

To build DATuner:

            % make
    
It generates files under releases/$(OS)\_$(ARCH). Then add MPI Path on your PATH (example):

            % export PATH=releases/Linux_x86_64/install/bin:$PATH

To setup environment for parallel tuning:

  1) Specify the number of machines used in my_hosts 
  
  2) Password-less login. on each machine do:
    
            % cd releases/Linux_x86_64/scripts
    
            % ssh-keygen -t rsa
    
            % ./envset.sh

###  Evaluation

1) Easy mode:(currently support VTR and Vivado)

            % cd releases/Linux_x86_64/scripts/eda_flows
    
    The usage of run_easy.py script is: 

    Usage: run_easy.py [options]
    
    Options:
      
      -h, --help 
      
      Show this help msg and exit
      
      -t TOOL, --tool=TOOL  
      
      Currently support VTR and Vivado. If your tool is not supported, try advance mode
      
      -v VTRPATH, --vtrPath=VTRPATH If VTR is used, please specify the path to vtr_flow
      
      -c DESIGN, --circuit=DESIGN The design to tune. For VTR just specify the design name; For Vivado specify the absoluate path to design
      
      -m TOPMODULE, --topmodule=TOPMODULE Vivado design's top module
      
      -o OBJ, --objective=OBJ The objective to tune. default: timing
      
      -n PROCNUM, --proc_num=PROCNUM The number of machines to use
      
      -d TEMDIR,
      
      
      -tool <vivado|quartus|vpr>: specify which EDA flow uses
      
      -design <design>: the design to tune
      
      -obj <objective>: will support delay\area\wirelength (now only support timing)
    
    Options:
      
      -process_num <number>: how many processes used
      
      -temp_dir <dir>: directory used for all temporary files


    E.g., `./run_DATuner_easy.sh –t vpr –d diffeq1 –o timing`

    Outputs: under release/experiment/vpr/diffeq1/ 

Advance mode:

    run_DATuner_advance.sh –s <space_definition> -c <python_code> -d <design> [options]

    Parameters:

      -space < space_definition >: specify the path to space definition file

      -design <design>: the design to tune

      -pycode <python_code>:  python code for tuning

    Options:
  
      -tool_name <name>: user’s program’s name

      -process_num <number>: how many processes used

      -temp_dir <dir>: directory used for all temporary files

    E.g., `./run_DATuner_easy.sh –s ./user_program_example/space.txt  -c ./user_program_example/tuneProgram.py –d diffeq1 -t my`

    Outputs: under release/experiment/my/diffeq1


### Additional Information
#### Running on multiple hosts:
####  SSH login without password 
http://blog.csdn.net/educast/article/details/7174498

####  Make sure programs can run across multiple hosts
https://www.open-mpi.org/faq/?category=running#diagnose-multi-host-problems 

(11. How can I diagnose problems when running across multiple hosts?)
