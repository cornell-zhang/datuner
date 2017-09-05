#-----------------------------------------------------
# user interface for custom mode (settings options)
#-----------------------------------------------------
# Author: Shaojie Xiang 
# Date:   7/26/2017
# brief:  simplifed user interface for vtr

# Specify the absolute path to the Python code
py_code = '/home/sx233/datuner/releases/Linux_x86_64/scripts/eda_flows/custom/tune_lr.py'

# Specify the design path, either absolute or relative
design_path = '/hime/sx233/datuner/spamfilter'

#------user defined tuning parameters-----------------
# set the parameter you do not want to tune as:
# "param_name property" like: param1 = 'on' or 0.8
#-----------------------------------------------------
custom_flags = [
  'FEA_I', 
  'FEA_F', 
  'DATA_I',
  'DATA_F', 
  'DATA2', 
  'LABEL',
  'LABEL2'  
]

FEA_I = [63,64]
FEA_F = [12,13]
DATA_I = [15,16]
DATA_F = [4,5]
DATA2 = [63,64]
LABEL = [1,2]
LABEL2 = [8,9]
#-----------------------------------------------------
