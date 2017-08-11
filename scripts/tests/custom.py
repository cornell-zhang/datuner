# user interface for custom mode (settings options)
#----------------------------------------------------
# Author: Shaojie Xiang 
# Date:   7/26/2017
# brief:  simplifed user interface for vtr

py_code = '$HOME/datuner/releases/Linux_x86_64/scripts/eda_flows/cordic/tunefp.py'
design_path = '$HOME/datuner/releases/Linux_x86_64/scripts/eda_flows/cordic'

# set the parameter you do not want to tune as:
# "param_name property" like: param1 = 'on' or 0.8
#-----------------------------------------------------

custom_flags = [
  'fixtypex_0', 
  'fixtypex_1', 
  'fixtypey_0',
  'fixtypey_1', 
  'fixtypez_0', 
  'fixtypez_1'  
]

fixtypex_0 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
fixtypex_1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
fixtypey_0 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
fixtypey_1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
fixtypez_0 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
fixtypez_1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#---------------------------------------------------------
