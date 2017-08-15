#-----------------------------------------------------
# user interface for vtr tuning (settings options)
#-----------------------------------------------------
# Author: Shaojie Xiang 
# Date:   7/26/2017
# brief:  simplifed user interface for vtr

# Specify the design path, either absolute or relative
design_path = '$HOME/datuner/design/diffeq1'

tool_path = 'vtr_flow_holder'

#------user defined tuning parameters-----------------
# set the parameter you do not want to tune as:
# "param_name property" like: param1 = 'on' or 0.8
#-----------------------------------------------------

# abc_flags
resyn = ['on', 'off'] 
resyn2 = ['on', 'off']
resyn3 = ['on', 'off']

# vtr_pack_flags
alpha_clustering = (0, 1)
beta_clustering = (0, 1)
allow_unrelated_clustering = ['on', 'off']
connection_driven_clustering = ['on', 'off']

# vtr_place_flags
alpha_t = (0.5, 0.9)
seed = [1, 2, 3, 4, 5]
inner_num = [1, 10, 100]
timing_tradeoff = (0.3, 0.7)
inner_loop_recompute_divider = [1, 0, 5]
td_place_exp_first = [1, 0, 3]
td_place_exp_last = [5, 8, 10]

# vtr_route_flags
max_router_iterations = [20, 50, 80]
initial_pres_fac = (0.3, 100)
pres_fac_mult = (1.2, 2)
acc_fac = (1, 2)
bb_factor = [1, 3, 5]
base_cost_type = ['demand_only', 'delay_normalized']
astar_fac = (1, 2)
max_criticality = (0.8, 1)
criticality_exp = (0.8, 1)

#-----------------------------------------------------
