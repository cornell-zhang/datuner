#!/usr/bin/python
#===================================================
# run advanced mode
#===================================================
# @author : Chang Xu
# @date   : 4/20/2017
# @brief  : A python script to run DATuner in advanced mode
#

import os
import sys
import optparse

#-------------------------
# Define options
#-------------------------

parser = optparse.OptionParser()

parser.add_option('-s', '--spaceFile', action="store", dest="spaceFile",
    help='User defined search space')

parser.add_option('-c','--circuit',action="store",dest="designpath",
    help='Path to design to tune. (use absolute path). For vtr, only specify design name is also legal')

parser.add_option('-n', '--proc_num', action="store",
    default=3, dest="procNum",
    help='The number of machines to use.')

parser.add_option('-d', '--dir', action="store",
    default="./", dest="tempDir",
    help='Directory for saving temporary files. (use absolute path)')

parser.add_option('-p', '--path', action="store",
    default=sys.path[0], dest="scriptPath",
    help='The script path of DATuner package. (use absolute path)')

parser.add_option('-t', '--tool', action="store", dest="tool",
    default="edatool",
    help='User\'s tool name')

(opts, args) = parser.parse_args()

if opts.spaceFile is None:
  print "Please specify the search space"
  sys.exit(1)

#if opts.pyCode is None:
#  print "Please specify the tune code"
#  sys.exit(1)


#--------------------------
# Preparation & Check
#--------------------------

design = os.path.basename(opts.designpath)
designdir = os.path.dirname(opts.designpath)

workspace = opts.tempDir+"/"+opts.tool+"/"+design
try:
  os.makedirs(workspace)
except:
  pass

binDir = opts.scriptPath+"/../bin"
srcFile = opts.scriptPath+"/user_program_example/tuneProgram.py"

sedcmd = "sed -e \"s:BENCH_HOLDER:"+design+":g\" -e \"s:WORKSPACE_HOLDER:"+workspace+":g\" -e \"s:SCRIPTPATH_HOLDER:"+opts.scriptPath+":g\" "+srcFile+" > "+workspace+"/tuneProgram.py"
os.system(sedcmd)

cpcmd = "cp "+opts.scriptPath+"/programWrapper.py "+workspace
os.system(cpcmd)

cpcmd = "cp "+opts.scriptPath+"/adddeps.py "+workspace
os.system(cpcmd)

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
    "./DATuner_master -space "+opts.spaceFile+" : -np "+str(opts.procNum)+" --hostfile "+\
    opts.scriptPath+"/my_hosts "+"./DATuner_worker -design "+design+" -path "+workspace+\
    " --parallelism=1 > log"
os.system(runcmd)







