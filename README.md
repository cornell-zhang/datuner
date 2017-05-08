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
   
       % ./run_easy.py -t vtr -v /home/xuchang/nas/project/daTuner/myrelease/build/pkgs/vtr/vtr_release/vtr_flow -c diffeq1 -d /home/xuchang/nas/project/daTuner/workspace
       
       % ./run_easy.py -t vivado -c /home/xuchang/nas/project/daTuner/myrelease/scripts/eda_flows/vivado/design/diffeq1 -m diffeq_paj_convert -d /home/xuchang/nas/project/daTuner/workspace
   

2) Advance mode:

    
    Examples:(more details will give later)
   
       % ./run_advance.py -s /home/xuchang/nas/project/daTuner/myrelease/releases/Linux_x86_64/scripts/
       user_program_example/space.txt -c diffeq1  -d /home/xuchang/nas/project/daTuner/workspace



### Additional Information
#### Running on multiple hosts:
####  SSH login without password 
http://blog.csdn.net/educast/article/details/7174498

####  Make sure programs can run across multiple hosts
https://www.open-mpi.org/faq/?category=running#diagnose-multi-host-problems 

(11. How can I diagnose problems when running across multiple hosts?)
