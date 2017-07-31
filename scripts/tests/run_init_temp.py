import os
import sys

pwd =os.getcwd()
tpath = 'vtr_flow_holder'
design = 'diffeq1'
wrksp = 'workspace_holder'
proc_num = 1

datpath = sys.path[0]
srcFile = datpath+"/run_DATuner.py"

rep_cmd = "sed -e \"s:TOOL_PATH_HOLD:"+tpath+":g\" -e \"s:DESIGN_NAME_HOLD:"+design+":g\" -e \"s:WORK_SPACE_HOLD:"+wrksp+":g\" -e \"s:DATUNER_PATH_HOLD:"+datpath+":g\" -e \"s:PROC_NUM_HOLD:"+str(proc_num)+":g\" "+srcFile+" > "+datpath+"/run_DATuner.py"
os.system(rep_cmd)

run_cmd = "python "+ pwd + "/releases/Linux_x86_64/scripts/run_DATuner.py -f vtr -t 20 2 0 0.2197 -p 1 -b 1"
print "call: python ./run_DATuner.py -f vtr -t 20 2 0 0.2197 -p 1 -b 1" +" " + run_cmd
os.popen(run_cmd)
