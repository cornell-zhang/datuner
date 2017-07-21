import os
import sys

pwd =os.getcwd()
tpath = "vtr_flow_holder"
design = "diffeq1"
wrksp = "workspace_holder"
proc_num = 1

datpath = sys.path[0]
srcFile = datpath+"/run_DATuner.py"

rep_cmd = "sed -e \"s:TOOL_PATH:"+tpath+":g\" -e \"s:DESIGN_NAME:"+design+":g\" -e \"s:WORKSPACE:"+wrksp+":g\" -e \"s:DATuner_PATH:"+datpath+":g\" -e \"s:PROC_NUM:"+str(proc_num)+":g\" "+srcFile+" > "+datpath+"/datuner"+"_new.py"
os.system(rep_cmd)

run_cmd = "python "+ pwd + "/releases/Linux_x86_64/scripts/datuner_new.py -f vtr -t 20 2 0 0.2197 -p 2 -b 1000"
print "call: python ./datuner_new.py -f vtr -t 20 2 0 0.2197 -p 2 -b 1000"  
os.system(run_cmd)
