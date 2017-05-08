#!/usr/bin/python
#===================================================
# run easy mode
#===================================================
# @author : Chang Xu
# @date   : 4/20/2017
# @brief  : A python script to run DATuner in easy mode
#

import os
import sys
import optparse

#-------------------------
# Define options
#-------------------------

parser = optparse.OptionParser()

parser.add_option('-t','--tool',action="store",type="choice",
    dest="tool", choices=["vtr","vivado"],
    help='Currently support vtr and vivado. If your tool is not supported, try advanced mode.')

parser.add_option('-v', '--vtrPath', action="store", dest="vtrPath",
    help='If vtr is used, please specify the path to vtr_flow. (use absolute path)')

parser.add_option('-c','--circuit',action="store",dest="designpath",
    help='Path to design to tune. (use absolute path). For vtr, only specify design name is also legal')

parser.add_option('-m','--topmodule',action="store",dest="topmodule",
    help='Tell vivado the topmodule\'s name')

parser.add_option('-o','--objective',action="store",dest="obj",
    default="timing",
    help='The objective to tune. default: timing')

parser.add_option('-n', '--proc_num', action="store",
    default=3, dest="procNum",
    help='The number of machines to use.')

parser.add_option('-d', '--dir', action="store",
    default="./", dest="tempDir",
    help='Directory for saving temporary files. (use absolute path)')

parser.add_option('-p', '--path', action="store",
    default=sys.path[0], dest="scriptPath",
    help='The script path of DATuner package. (use absolute path)')

(opts, args) = parser.parse_args()

if opts.tool is None:
  print "Please specify the EDA flow to use"
  sys.exit(1)

if opts.tool == "vtr":
  if opts.vtrPath is None:
    print "vtr is used. Please specify the vtr path."
    sys.exit(1)

if opts.designpath is None:
  print "Please specify the design to tune"
  sys.exit(1)

if opts.tool == "vivado":
  if opts.topmodule is None:
    print "vivado is used. Please specify the top module."
    sys.exit(1)

#--------------------------
# Preparation & Check
#--------------------------

design = os.path.basename(opts.designpath)
designdir = os.path.dirname(opts.designpath)

print design
print designdir

workspace = opts.tempDir+"/"+opts.tool+"/"+design
try:
  os.makedirs(workspace)
except:
  pass

binDir = opts.scriptPath+"/../bin"
srcFile = opts.scriptPath+"/eda_flows/"+opts.tool+"/tune"+opts.tool+".py"
if opts.tool == "vtr":
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:VTRFLOWPATH_HOLDER:"+opts.vtrPath+":g\" -e \"s:SCRIPTPATH_HOLDER:"+opts.scriptPath+":g\" "+srcFile+" > "+workspace+"/tune"+opts.tool+".py"
  os.system(sedcmd)

if opts.tool == "vivado":
  sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:TOPMODULE_HOLDER:"+opts.topmodule+":g\" -e \"s:SCRIPTPATH_HOLDER:"+opts.scriptPath+":g\" -e \"s:DESIGNPATH_HOLDER:"+designdir+":g\" "+srcFile+" > "+workspace+"/tune"+opts.tool+".py"
  print sedcmd
  os.system(sedcmd)

cpcmd = "cp "+binDir+"/DATuner_master "+binDir+"/DATuner_worker "+workspace
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


runcmd = "mpirun -np 1 "+\
    "./DATuner_master -"+opts.tool+" : -np "+str(opts.procNum)+" --hostfile "+\
    opts.scriptPath+"/my_hosts "+"./DATuner_worker -design "+design+" -path "+workspace+\
    " --parallelism=1 > log"
os.system(runcmd)







