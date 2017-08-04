#-----------------------------------------------------
# user interface for quartus tuning (settings options)
#----------------------------------------------------
# Author:  Shaojie Xiang 
# Date:    7/26/2017
# brief:   simplifed user interface for quartus
# example: run "datuner.py -f quartus -b 6 -p 1 -t 20 0 0 0"

top_module = 'lab5_top'                                                                                         # settings for vivado and quartus
design_path = '/home/sx233/datuner/releases/Linux_x86_64/scripts/eda_flows/quartus/design/processor'            # cp in design path to wrkspace          
#------user defined tuning paramter-------------------
# set the parameter you do not want to tune as:
# "param_name property" like: param1 = 'on' or 0.8
#-----------------------------------------------------


# map flags
map_effort = ['auto', 'fast']
map_optimize = ['area', 'speed', 'balanced']

# fit flags
fit_effort = ['standard', 'fast', 'auto']
fit_optimize_io_register_for_timing = ['on', 'off']
fit_pack_register = ['off', 'normal', 'minimize_area', 'minimize_area_with_chains', 'auto']
fit_tdc = ['on', 'off']

#---------------------------------------------------------


