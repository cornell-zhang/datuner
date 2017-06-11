#!/usr/bin/python
#===================================================
# run DATuner
#===================================================
# @author : Chang Xu
# @date   : 4/20/2017
# @brief  : A python script to run DATuner
#
import re
import os
import sys
import optparse

#-------------------------
# parse parameters
#-------------------------
if len(sys.argv) < 2:
  print "Usage: run_easy.py <configuration file>"
  sys.exit(1)

config_file = sys.argv[1]
argument = {'TOOL_NAME':'', 'TOOL_INSTALL_PATH':'', 'DESIGN_NAME':'', 'DESIGN_SAVE_PATH':'', 'TOPMODULE':'', 'SPACE_DEFINITION':'', 'PYTHON_CODE':'', 'WORKSPACE':'', 'DATuner_PATH':sys.path[0], 'PROC_NUM':'3', 'TEST_LIMIT':'100', 'STOP_AFTER':'7200', 'OBJECTIVE':'time'}

print argument['DATuner_PATH']
file = open(config_file)
while 1:
  line = file.readline()
  if not line:
    break
  line =line[:-1]
  lists = line.split(' ')
  print lists
  if len(lists) > 1:
    argument[lists[0]] = lists[1]


#-------parameters check------
for word in argument:
  print word, argument[word]

if argument['TOOL_NAME'] == "vtr":
  if argument['TOOL_INSTALL_PATH'] == '':
    print "vtr is used. Please specify the vtr path."
    sys.exit(1)
elif argument['TOOL_NAME'] == 'vivado':
  if argument['TOPMODULE'] == '':
    print "vivado is used. Please specify the top module."
    sys.exit(1)
else:
  if argument['PYTHON_CODE'] == '':
    print "please specify the python code to excute OpenTuner."
    sys.exit(1)
  if argument['SPACE_DEFINITION'] == '':
    print "please specify the space definition file."
    sys.exit(1)

#--------------------------
# Preparation & Check
#--------------------------

design = argument['DESIGN_NAME']
designdir = argument['DESIGN_SAVE_PATH']

print design
print designdir

workspace = argument['WORKSPACE']+"/"+argument['TOOL_NAME']+"/"+design
try:
  os.makedirs(workspace)
except:
  pass

binDir =  argument['DATuner_PATH']+"/../bin"
cpcmd = "cp "+binDir+"/DATuner_master "+binDir+"/DATuner_worker "+workspace
os.system(cpcmd)

if argument['TOOL_NAME'] == "vtr":
  srcFile = argument['DATuner_PATH']+"/eda_flows/"+argument['TOOL_NAME']+"/tune"+argument['TOOL_NAME']+".py"
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:VTRFLOWPATH_HOLDER:"+argument['TOOL_INSTALL_PATH']+":g\" -e \"s:SCRIPTPATH_HOLDER:"+argument['DATuner_PATH']+":g\" "+srcFile+" > "+workspace+"/tune"+argument['TOOL_NAME']+".py"
  os.system(sedcmd)
  cpcmd = "cp "+argument['DATuner_PATH']+"/eda_flows/"+argument['TOOL_NAME']+"/"+argument['TOOL_NAME']+"_space.txt "+workspace
  os.system(cpcmd)
elif argument['TOOL_NAME'] == "vivado":
  srcFile = argument['DATuner_PATH']+"/eda_flows/"+argument['TOOL_NAME']+"/tune"+argument['TOOL_NAME']+".py"
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:TOPMODULE_HOLDER:"+argument['TOPMODULE']+":g\" -e \"s:SCRIPTPATH_HOLDER:"+argument['DATuner_PATH']+":g\" -e \"s:DESIGNPATH_HOLDER:"+designdir+":g\" "+srcFile+" > "+workspace+"/tune"+argument['TOOL_NAME']+".py"
  print sedcmd
  os.system(sedcmd)
  cpcmd = "cp "+argument['DATuner_PATH']+"/eda_flows/"+argument['TOOL_NAME']+"/"+argument['TOOL_NAME']+"_space.txt "+workspace
  os.system(cpcmd)
else:
  srcFile = argument['PYTHON_CODE']
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:SCRIPTPATH_HOLDER:"+argument['DATuner_PATH']+":g\" "+srcFile+" > "+workspace+"/tuneProgram.py"
  os.system(sedcmd)
  cpcmd = "cp "+argument['DATuner_PATH']+"/eda_flows/user_program_example/programWrapper.py "+workspace
  os.system(cpcmd)
  cpcmd = "cp "+argument['DATuner_PATH']+"/adddeps.py "+workspace
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

if argument['TOOL_NAME'] == "vtr" or argument['TOOL_NAME'] == "vivado":
  runcmd = mpi_path+" -np 1 "+\
    "./DATuner_master -"+argument['TOOL_NAME']+" --test-limit "+argument['TEST_LIMIT']+" --stop-after "+\
    argument['STOP_AFTER']+" --path "+workspace+" : -np "+argument['PROC_NUM']+" --hostfile "+\
    argument['DATuner_PATH']+"/my_hosts "+"./DATuner_worker -design "+design+" -path "+workspace+\
    " --parallelism=1 > log"
  os.system(runcmd)
else:
  runcmd = mpi_path+" -np 1 "+\
      "./DATuner_master --space "+argument['SPACE_DEFINITION']+" --path "+workspace+" --test-limit "+argument['TEST_LIMIT']+\
      " --stop-after "+argument['STOP_AFTER']+" : -np "+argument['PROC_NUM']+" --hostfile "+\
      argument['DATuner_PATH']+"/my_hosts "+"./DATuner_worker -design "+design+" -path "+workspace+\
      " --parallelism=1 > log"
  os.system(runcmd)






