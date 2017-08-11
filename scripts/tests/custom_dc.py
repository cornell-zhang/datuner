# user interface for custom mode (settings options)
#----------------------------------------------------
# Author: Gai Liu
# Date:   8/10/2017
# brief:  user interface for custom mode with Design Compiler

py_code = '/work/zhang/users/liu/datuner/releases/Linux_x86_64/scripts/eda_flows/custom/tune_dc.py'
design_path = '/work/zhang/users/liu/datuner/releases/Linux_x86_64/scripts/eda_flows/custom/designs/diffeq1'

# set the parameter you do not want to tune as:
# "param_name property" like: param1 = 'on' or 0.8
#-----------------------------------------------------

custom_flags = [
  'gate_clock', 
  'retime', 
  'timing_high_effort_script',
  'area_high_effort_script', 
  'no_boundary_optimization'
]

gate_clock = ['on', 'off']
retime = ['on', 'off']
timing_high_effort_script = ['on', 'off']
area_high_effort_script = ['on', 'off']
no_boundary_optimization = ['on', 'off']

#---------------------------------------------------------
