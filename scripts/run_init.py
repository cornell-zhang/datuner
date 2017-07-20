#-----------------------------------------------
# initialize the param of tool/datuner/workspace 
# this info is supposed to be assigned by the user
#-----------------------------------------------

import os
import sys

tpath = "/work/zhang/users/sx233/datuner/build/pkgs/vtr/vtr_release/vtr_flow"
design = "diffeq1"
wrksp = "/work/zhang/users/sx233/datuner/test"
proc_num = 1

datpath = sys.path[0]
srcFile = datpath+"/run_DATuner.py"

#change the NMAE_HOLDER in run_DATuner.py

rep_cmd = "sed -e \"s:TOOL_PATH:"+tpath+":g\" -e \"s:DESIGN_NAME:"+design+":g\" -e \"s:WROKSPACE:"+wrksp+":g\" -e \"s:DATuner_PATH:"+datpath+":g\" -e \"s:PROC_NUM:"+str(proc_num)+":g\" "+srcFile+" > "+datpath+"/datuner"+"_new.py"
os.system(rep_cmd)

# run the datuner_new.py with the assigned paramter
print "call: python ./datuner_new.py --tool vtr --timeout 20 2 0 0.1 --para-factor 2 --max-run 1000"  
os.system("python ./datuner_new.py --tool vtr --timeout 20 2 0 0.2197 --para-factor 2 --max-run 1000")
