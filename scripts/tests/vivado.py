#-----------------------------------------------------
# user interface for vivado tuning (settings options)
#----------------------------------------------------
# Author: Shaojie Xiang 
# Date:   7/26/2017
# brief:  simplifed user interface for vivado

top_module = 'IntMulFixedLatRTL'                                     # settings for vivado and quartus
design_path = '/work/zhang/users/eu49/datuner/releases/Linux_x86_64/scripts/eda_flows/vivado/design/mul/'      
modify_cst = 'no'                                                    # whether to modify the time constraint  

#------user defined tuning paramter-------------------
# set the parameter you do not want to tune as:
# "param_name property" like: param1 = 'on' or 0.8
#-----------------------------------------------------

Optdirective = ['Default', 'Explore', 'ExploreSequentialArea', 'AddRemap', 'ExploreArea']
Placedirective = ['Default', 'Explore', 'ExtraNetDelay_high', 'ExtraNetDelay_medium','ExtraNetDelay_low', 'ExtraPostPlacementOpt', 'WLDrivenBlockPlacement', 'LateBlockPlacement', 'AltSpreadLogic_low', 'AltSpreadLogic_medium', 'AltSpreadLogic_high']
fanout_opt = ['on', 'off']
placement_opt = ['on', 'off']
critical_cell_opt = ['on', 'off']
critical_pin_opt = ['on', 'off']
retime = ['on', 'off']
rewire = ['on', 'off']
Routedirective = ['Default', 'Explore', 'HigherDelayCost']

# invalid when modify_cst = 'yes'
tune_cst = (4.2, 5.0)

#---------------------------------------------------------


