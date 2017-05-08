# DATuner User Guide

### Prerequisites

OpenTuner: http://opentuner.org/tutorial/setup/

###  Compilation

To build DATuner:

    % make
    
It generates files under releases/$(OS)\_$(ARCH).

Add MPI Path on your PATH (example):

    % export PATH=releases/Linux_x86_64/install/bin:$PATH

To setup environment for parallel tuning:


    

First build the prerequisites, then follow the instructions below to configure DATuner.

Go into PathTo-DATuner/release/src directory

In Makefile, add the include folder of your Python and Mpich. And point out the path of your Python and Mpich lib.

E.g., `INCLUDES = -I PathTo-Python/include/python2.7 -I PathTo-Mpich/include`

`LDFLAGS = -L PathTo-Mpich/lib -lmpi -L PathTo-Python/lib -lpython2.7`

Go into PathTo-DATuner/release directory

`./configure`

`make`

Generate master and worker in PathTo-DATuner/release/src

###  Evaluation

Go into PathTo-DATuner/scripts directory, we support two modes to use DATuner: easy mode and advance mode.

Easy mode

    run_DATuner_easy.sh –t <vivado|quartus|vpr> -d <design> -o <objective> [options]
    
    Parameters:
      
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
