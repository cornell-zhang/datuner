#!/usr/bin/python
#===================================================
# run DATuner
#===================================================
# @author : Chang Xu
# @date   : 4/20/2017
# @brief  : A python script to run DATuner

import re
import os
import sys
import optparse
import argparse

#-------------------------
# parse parameters
#-------------------------
parser = argparse.ArgumentParser(description='command interface')
parser.add_argument('--tool',type=str,choices=['vtr','vivado','other'])
parser.add_argument('--max-run',type=int,default=1000,dest='limit')
parser.add_argument('--timeout',type=str,default='7200 0 0 0',dest='stop',help='format: sec min hour day',nargs=4)
parser.add_argument('--para-factor',type=int,dest='para_fac',default=1)
args = parser.parse_args()

if len(sys.argv) < 2:
  print "Please input parameter command line"
  parser.print_help()
  sys.exit(1)

argument = {'TOOL_INSTALL_PATH':'', 'DESIGN_NAME':'', 'DESIGN_SAVE_PATH':'', 'TOP_MODULE':'', 'SPACE_DEFINITION':'', 'PYTHON_CODE':'', 'WORKSPACE':'', 'DATuner_PATH':sys.path[0], 'PROC_NUM':'3', 'TEST_LIMIT':'100', 'STOP_AFTER':'7200', 'OBJECTIVE':'time', 'MODIFY_CST':'', 'DEFAULT_CST':''}

# ----- initialization opts------
tpath = "TOOL_PATH"
design = "DESIGN_NAME"
designdir = "DESIGN_PATH"
module = "TOP_MODULE"
space_def = "SPACE_DEFINITION"
pycode = "PYTHON_CODE"                           # python tuning file to call OpenTuner
wrksp = "WORKSPACE"                              # quasi-workspace 
procnum = "PROC_NUM"                             # the number of subsapce searching in parallel ?
datpath = "DATuner_PATH"                         # set as sys.path[0]
objective = "OBJECTIVE"                          # score or target of the tuning process remained to be minimize(maximize)
modify_cst = "MODIFY_CST"                        # Vivado option: whether to modify
time_cst = "DEFAULT_CST"                         # timing constraint, default 4.5


#-------parameters check------
if args.tool== '':
  print "please specify the tool name."
  sys.exit(1)

if design == '':
  print "please specify the design name."
  sys.exit(1)

if wrksp == '':
  print "please specify the directory to save intermediate data."
  sys.exit(1)

if os.path.exists(datpath+"/../bin") == False:
  print "Please call DATuner under $HOME/releases/Linux_x86_64/scripts/"
  sys.exit(1)

if args.tool == "vtr":
  if os.path.exists(tpath+"/scripts") == False:
    print "vtr path is not correct. Please check. The path should to point to .../vtr/vtr_release/vtr_flow"
    sys.exit(1)
elif args.tool == 'vivado':
  if module == '':
    print "vivado is used. Please specify the top module."
    sys.exit(1)
else:
  if pycode== '':
    print "please specify the python code to excute OpenTuner."
    sys.exit(1)
  if space_def == '':
    print "please specify the space definition file."
    sys.exit(1)

tune_cst = 0
if modify_cst == 'y' or modify_cst == 'yes':
  tune_cst = 1
  if time_cst == '':
    print "please support the default timing constraint."
    sys.exit(1)
    
time_text = args.stop
if len(time_text) != 4:
  print "please input time with format: sec|min|hour|day"
  sys.exit(1)
else:
  stoptime = float(time_text[0])+60.0*float(time_text[1])+3600.0*float(time_text[2])+86400.0*float(time_text[3])
  
#--------------------------
# Preparation & Check
#--------------------------

workspace = wrksp+"/"+args.tool+"/"+design     # real workspace, to store Master, Worker, Python Tuner and space_def file
try:
  os.makedirs(workspace)
except:
  pass

binDir =  datpath+"/../bin"
cpcmd = "cp "+binDir+"/DATuner_master "+binDir+"/DATuner_worker "+workspace
os.system(cpcmd)

if args.tool == "vtr":
  srcFile = datpath+"/eda_flows/"+args.tool+"/tune"+args.tool+".py"
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:VTRFLOWPATH_HOLDER:"+tpath+":g\" -e \"s:SCRIPTPATH_HOLDER:"+datpath+":g\" "+srcFile+" > "+workspace+"/tune"+args.tool+".py"
  os.system(sedcmd)
  cpcmd = "cp "+datpath+"/eda_flows/"+args.tool+"/"+args.tool+"_space.txt "+workspace
  os.system(cpcmd)
elif args.tool == "vivado":
  srcFile = datpath+"/eda_flows/"+args.tool
  if tune_cst ==1:
    srcFile = srcFile + "/tunevivado_cst.py"
  else:
    srcFile = srcFile + "/tunevivado.py"

  print "debug use "+srcFile
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:TOPMODULE_HOLDER:"+module+":g\" -e \"s:SCRIPTPATH_HOLDER:"+datpath+":g\" -e \"s:DESIGNPATH_HOLDER:"+designdir+":g\" "+srcFile+" > "+workspace+"/tune"+args.tool+".py"
  os.system(sedcmd)

  space_file_cmd ="cp "+datpath+"/eda_flows/"+args.tool+"/"+args.tool+"_space.txt "+workspace
  if tune_cst == 1:
    print "debug tune cst"
    lower_cst = float(time_cst) * 0.8
    upper_cst = float(time_cst) * 1.5
    space_file_cmd="sed -e \"s:LOWER_BOUND_HOLDER:"+str(lower_cst)+":g\" -e \"s:UPPER_BOUND_HOLDER:"+str(upper_cst)+":g\" "+datpath+"/eda_flows/"+args.tool+"/"+args.tool+"_space_cst.txt > "+workspace+"/"+args.tool+"_space.txt"
  os.system(space_file_cmd)
else:
  srcFile = pycode
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:SCRIPTPATH_HOLDER:"+datpath+":g\" "+srcFile+" > "+workspace+"/tuneProgram.py"
  os.system(sedcmd)
  cpcmd = "cp "+datpath+"/eda_flows/user_program_example/programWrapper.py "+workspace
  os.system(cpcmd)
  cpcmd = "cp "+datpath+"/adddeps.py "+workspace
  os.system(cpcmd)


#---------------------------
# Run DATuner
#---------------------------
os.chdir(workspace)
try:
  os.remove("log")
  shutil.rmtree("opentuner.db")
except:
  pass

#mpi_path="/home/xuchang/nas/project/daTuner/myrelease/build/pkgs/install/bin/mpirun"
mpi_path="mpirun"

if args.tool == "vtr" or args.tool == "vivado":
  runcmd = mpi_path+" -np 1 "+\
    "./DATuner_master -"+args.tool+" --test-limit "+str(args.limit)+" --stop-after "+\
    str(stoptime)+" --path "+workspace+" : -np "+str(procnum)+" --hostfile "+\
    datpath+"/my_hosts "+"./DATuner_worker -design "+design+" -path "+workspace+\
    " -tune_cst "+str(tune_cst)+" --parallelism=1 > log"
  os.system(runcmd)
else:
  runcmd = mpi_path+" -np 1 "+\
      "./DATuner_master --space "+space_def+" --path "+workspace+" --test-limit "+str(args.limit)+\
      " --stop-after "+str(stoptime)+" : -np "+str(procnum)+" --hostfile "+\
      datpath+"/my_hosts "+"./DATuner_worker -design "+design+" -path "+workspace+\
      " --parallelism=1 > log"
  os.system(runcmd)
  

