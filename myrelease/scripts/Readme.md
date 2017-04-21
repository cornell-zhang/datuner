We support two modes to use DATuner.

##########Easy mode######################
  run_DATuner_easy.sh –t <vivado|quartus|vpr> -d <design> -o <objective> [options]
    Parameters:
      -tool <vivado|quartus|vpr>: specify which EDA flow uses
      -design <design>: the design to tune
      -obj <objective>: will support delay\area\wirelength (now only support timing)
    Options:
      -process_num <number>: how many processes used
      -temp_dir <dir>: directory used for all temporary files

  E.g., ./run_DATuner_easy.sh –t vpr –d diffeq1 –o timing
  Outputs: under release/experiment/vpr/diffeq1/ 


#########Advance mode###################
  run_DATuner_advance.sh –s <space_definition> -c <python_code> -d <design> [options]
    Parameters:
      -space < space_definition >: specify the path to space definition file
      -design <design>: the design to tune
      -pycode <python_code>:  python code for tuning
    Options:
      -tool_name <name>: user’s program’s name
      -process_num <number>: how many processes used
      -temp_dir <dir>: directory used for all temporary files

  E.g., ./run_DATuner_easy.sh –s ./user_program_example/space.txt  -c ./user_program_example/tuneProgram.py –d diffeq1 -t my 
  Outputs: under release/experiment/my/diffeq1



