#-----------------------------------------------------
# user interface for quartus tuning (settings options)
#-----------------------------------------------------
# Author:  Shaojie Xiang 
# Date:    7/26/2017
# brief:   simplifed user interface for quartus
# example: run "datuner.py -f quartus -b 500 -p 2 -t 1d:1h:20m:10s"

# Specify the name of the top module
top_module = 'lab5_top'

# Specify the design path, either absolute or relative
design_path = '$HOME/datuner/releases/Linux_x86_64/scripts/eda_flows/quartus/design/processor'

#------user defined tuning parameters-----------------
# set the parameter you do not want to tune as:
# "param_name property" like: param1 = 'on' or 0.8
#-----------------------------------------------------

# map options
map_effort = ['auto', 'fast']
map_ignore_carry_buffers = ['on', 'off']
map_ignore_cascade_buffers = ['on', 'off']
map_optimize = ['area', 'speed', 'balanced']
map_state_machine_encoding = ['auto', 'minimal_bits',
                              'one_hot', 'user_encoded']

# fit options
fit_effort = ['standard', 'fast', 'auto']
fit_one_fit_attempt = ['on', 'off']
fit_optimize_io_register_for_timing = ['on', 'off']
fit_pack_register = ['off', 'normal', 'minimize_area',
                     'minimize_area_with_chains', 'auto']
fit_tdc = ['on', 'off']

#-----------------------------------------------------
