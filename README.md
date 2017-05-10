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

            % export PATH=$HOME/datuner/build/pkgs/python/install/bin:$HOME/datuner/releases/Linux_x86_64/install/bin:$PATH
            % export LD_LIBRARY_PATH=$HOME/datuner/build/pkgs/python/install/lib:$LD_LIBRARY_PATH
       
### Enable password-less SSH between machines

 * Specify the list of machines in `$HOME/releases/Linux_x86_64/scripts/my_hosts`. The default is using zhang-05 to zhang-08.
 * Make sure you can ssh without password from the host to each other machine. *You actually need to ssh to each of the machines at least once, because the first time you ssh into a new machine, a confirmation to the command line prompt is needed. Without this, mpich will actually error out.*
  
One way to enable password-less SSH:
    
            % cd $HOME/releases/Linux_x86_64/scripts
            % ssh-keygen -t rsa
            % ./envset.sh

###  Evaluation

  * Easy mode: (currently supports VTR and Vivado)

            % cd $HOME/releases/Linux_x86_64/scripts/eda_flows
    
    The usage of run_easy.py script is: 

       Usage: run_easy.py [options]
    
       Options:
      
         -h, --help  Show this help msg and exit
         -t TOOL, --tool=TOOL  Currently support VTR and Vivado. If your tool is not supported, try advance mode
         -v VTRPATH, --vtrPath=VTRPATH If VTR is used, please specify the path to vtr_flow
         -c DESIGN, --circuit=DESIGN The design to tune. For VTR just specify the design name; For Vivado specify the absoluate path to design
         -m TOPMODULE, --topmodule=TOPMODULE Vivado design's top module
         -o OBJ, --objective=OBJ The objective to tune. default: timing
         -n PROCNUM, --proc_num=PROCNUM The number of machines to use
         -d TEMPDIR, --dir=TEMPDIR Directory to save temporary files.(use absoluate path)
         -p SCRIPTPATH, --path=SCRIPTPATH The scriptpath of DATuner package.(use absoluate path)
      
      
   Examples:
   
       % ./run_easy.py -t vtr -v $HOME/vtr/vtr_release/vtr_flow -c diffeq1 -d $HOME/workspace -n 4
       % ./run_easy.py -t vivado -c $HOME/datuner/releases/Linux_x86_64/scripts/eda_flows/vivado/design/diffeq1 -m diffeq_paj_convert -d $HOME/workspace -n 4
   

  * Advance mode:
  
    Examples: (more details will give later)
    
            % ./run_advance.py -s $HOME/datuner/releases/Linux_x86_64/scripts/user_program_example/space.txt -c diffeq1  -d $HOME/workspace
