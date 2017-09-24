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
  'DATA2_I', 
  'LABEL_I',
  'LABEL2_I'  
]

FEA_I = [62,63,64,68]
FEA_F = [11,12,13,18]
DATA_I = [14,15,16,22]
DATA_F = [3,4,5,9]
DATA2_I = [62,63,64,68]
LABEL_I = [1,2,3,9]
LABEL2_I = [8,9,10,11]
#-----------------------------------------------------
