#---------------------Environment Setting----------#

envset.sh

#---------------------Run DATuner------------------#

To use DATuner, please support a configuration file to direct DATuner. 
DATuner project already contains scripts to tune several EDA tools(Built-in tool): vtr, vivado, and quartus.
Users can also tune their own tool(User tool). To support user defined tool, the space 
definition file and python code to use OpenTuner are required.

For Built-in tool and User tool, the required items of configuration file are different.  

configuration file:

---------------

  
  TOOL_NAME: required for both built-in tools(now only support vtr, vivado, and quartus) and user tools 

  TOOL_INSTALL_PATH required only for vtr.(the path to vtr_flow directory)
  
  DESIGN_NAME required for both built-in tools and user tools 
  
  DESIGN_SAVE_PATH required for vivado and quartus

  TOPMODULE required for vivado and quartus

  SPACE_DEFINITION required only for user tools

  PYTHON_CODE required only for user tools

  WORKSPACE required for both built-in tools and user tools

  PROC_NUM optional default value: 3

  TEST_LIMIT optional default value: 100

  STOP_AFTER optional default value: 7200(s)

  DATuner_PATH optional 

  OBJECTIVE optional

#---------------------Virsualization---------------#

