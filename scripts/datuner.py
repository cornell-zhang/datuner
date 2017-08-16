#!/usr/bin/python
#===================================================
# run DATuner
#===================================================
# @author : Chang Xu
# @date   : 8/7/2017
# @brief  : Top-level python script to run DATuner

import re
import os
import sys
import optparse
import argparse
import getpass

#-------------------------------------------------
# parse parameters and read information from py
#-------------------------------------------------
parser = argparse.ArgumentParser(description='main script for DATuner')
parser.add_argument('-f', '--flow', type=str, dest='tool', choices=['vtr','vivado','quartus','custom'])
parser.add_argument('-b', '--budget', type=int, default=1, dest='limit')
parser.add_argument('-t', '--timeout', type=str, default='0.0d:0.0h:0.0m:7200.0s', dest='stop', help='format: 4d:2h:5m:9s')
parser.add_argument('-p', '--parallel', type=int, default=1, dest='pf')
args = parser.parse_args()

if len(sys.argv) < 2:
  parser.print_help()
  sys.exit(1)

pwd = os.getcwd()
sys.path.append(pwd)

if os.path.exists(pwd + '/vtr.py') and args.tool == 'vtr':
  import vtr
  tool_path = eval(args.tool + '.tool_path')
elif os.path.exists(pwd + '/vivado.py') and args.tool == 'vivado':
  import vivado
  top_module = eval(args.tool + '.top_module')
elif os.path.exists(pwd + '/quartus.py') and args.tool == 'quartus':
  import quartus
  top_module = eval(args.tool + '.top_module')
elif os.path.exists(pwd + '/custom.py') and args.tool == 'custom':
  import custom
  custom_flags = eval(args.tool + '.custom_flags')
  py_code = eval(args.tool + '.py_code')
else:
  print "missing [tool_name].py under current folder"
  sys.exit(1)  

# set up the workspace path automatically
work_space = pwd + '/datuner.db'
print '[     0s]    INFO the current work space is: ' + work_space

design_path = eval(args.tool + '.design_path')
proc_num = args.pf
datuner_path = 'datuner_path_holder'
objective = 'OBJECTIVE_HOLD'
cst_value = 'CST_VALUE_HOLD'

# check design path
if args.tool == 'vivado' or args.tool == 'quartus':
  dir_list = []
  if eval(args.tool + '.design_path') == '':
    for count in os.listdir(pwd):
      if os.path.isdir(count):
        dir_list.append(count)
    print "design path not assigned."
    word = ''
    for index in dir_list:
      word += "  " + index
    design_input = raw_input("please enter other path or design name if in current folder: " + word +"\n")

    if design_input in dir_list:
      design_path = pwd + "/" + design_input
    elif not os.path.isdir(design_input):
      print "error: invalid design path"
    else:
      design_path = design_input
    print 'design_path is: ' + design_path
  elif os.path.isdir(eval(args.tool+'.design_path')):
    design_path = eval(args.tool+'.design_path')
  else:
    print "error: the design path is invalid"
    sys.exit(1)
else:
  design_path = eval(args.tool+'.design_path')

# extract design name from design path
design_name = design_path.split('/')[-1]

#-------parameters check------
if args.tool== '':
  print "please specify the tool name."
  sys.exit(1)

if design_name == '':
  print "please specify the design name."
  sys.exit(1)

if os.path.exists(datuner_path+"/../bin") == False:
  print datuner_path
  print "Please call DATuner under $HOME/releases/Linux_x86_64/scripts/"
  sys.exit(1)

if args.tool == "vtr":
  if os.path.exists(tool_path+"/scripts") == False:
    print "vtr path is not correct. Please check. The path should to point to .../vtr/vtr_release/vtr_flow"
    sys.exit(1)
elif args.tool == 'vivado':
  if top_module == '':
    print "vivado is used. Please specify the top module."
    sys.exit(1)
elif args.tool == 'quartus':
  if top_module == '':
    print "quartus is used. Please specify the top module."
    sys.exit(1)
else:
  if py_code== '':
    print "please specify the python code to excute OpenTuner."
    sys.exit(1)

tune_cst = 0
if args.tool == 'vivado':
  if eval(args.tool + '.modify_cst') == 'y' or eval(args.tool+'.modify_cst') == 'yes':
    tune_cst = 1
    if eval(args.tool + '.tune_cst') == '':
      print "please specify the default timing constraint."
      sys.exit(1)

# parser the time limit
timelist = args.stop.split(':')
minute = 0
day = 0
sec = 0
hour = 0
for timer in range(len(timelist)):
  if timelist[timer].endswith('s'):
    sec = float(timelist[timer][0:-1])
  if timelist[timer].endswith('d'):
    day = float(timelist[timer][0:-1])
  if timelist[timer].endswith('m'):
    minute = float(timelist[timer][0:-1])
  if timelist[timer].endswith('h'):
    hour = float(timelist[timer][0:-1])
stoptime = int(sec + 60.0 * minute + 3600.0 * hour + 86400.0 * day)
print '[     0s]    INFO time limit: ' + str(stoptime) + ' seconds'

#--------------------------
# Preparation & Check
#--------------------------

vtr_flags = [
    'resyn', 'resyn2', 'resyn3',
    'alpha_clustering', 'beta_clustering',
    'allow_unrelated_clustering', 'connection_driven_clustering',
    'alpha_t', 'seed', 'inner_num', 'timing_tradeoff',
    'inner_loop_recompute_divider', 'td_place_exp_first', 'td_place_exp_last',
    'max_router_iterations', 'initial_pres_fac', 'pres_fac_mult', 'acc_fac',
    'bb_factor', 'base_cost_type', 'astar_fac', 'max_criticality',
    'criticality_exp'
    ]

vivado_cst_flags = [
    'Optdirective', 'Placedirective', 'fanout_opt',
    'placement_opt', 'critical_cell_opt', 'critical_pin_opt',
    'retime', 'rewire', 'Routedirective',
    'tune_cst'
    ]

vivado_flags = vivado_cst_flags[0:-1]

quartus_flags = [
  'map_effort', 'map_ignore_carry_buffers', 'map_ignore_cascade_buffers',
  'map_optimize', 'map_state_machine_encoding', 'fit_effort',
  'fit_one_fit_attempt', 'fit_optimize_io_register_for_timing',
  'fit_pack_register', 'fit_tdc'
]

design = design_name
designdir = design_path
workspace = work_space + "/" + args.tool + "/" + design
try:
  if os.path.exists(workspace):
    os.system('rm -rf ' + workspace)
  os.makedirs(workspace)
except:
  pass

# set up the user defined search space
if args.tool == 'vtr':
  space_file_name = 'vtr_space.txt'
  flags = vtr_flags
elif args.tool == 'vivado':
  space_file_name = 'vivado_space.txt'
  if tune_cst == 0:
    flags = vivado_flags
  else:
    flags = vivado_cst_flags
elif args.tool == 'quartus':
  space_file_name = 'quartus_space.txt'
  flags = quartus_flags
elif args.tool == 'custom':
  space_file_name = 'custom_space.txt'
  flags = custom_flags

f = open(workspace + '/' + space_file_name, 'a')
for flag in flags:
  flag_type = eval(args.tool + '.' + flag)
  if isinstance(flag_type, str):
    word = '{' + str(flag_type).replace('\'', '') +'}'
    f.write(flag + ' EnumParameter ' + word + '\n')
  elif (len(flag_type) > 2 or isinstance(flag_type[0], str)):
    word = '{' + str(flag_type).replace('\'', '')[1: -1] + '}'
    f.write(flag + ' EnumParameter ' + word + '\n')
  else:
    word = '[' + str(flag_type[0]) + ' ,' + str(flag_type[1]) + ']'
    f.write(flag + ' FloatParameter ' + word + '\n')
f.close()

# copy necessary file to workspace
bin_dir = datuner_path + '/../bin'
cpcmd = 'cp ' + bin_dir + '/DATuner_master ' + bin_dir + '/DATuner_worker ' + workspace
os.system(cpcmd)

if args.tool == 'vtr':
  src_file = datuner_path + '/eda_flows/' + args.tool + '/tune_' + args.tool + '.py'
  sedcmd = 'sed -e \"s:BENCH_HOLDER:' + design \
            + ':g\" -e \"s:WORKSPACE_HOLDER:' + workspace \
            + ':g\" -e \"s:VTRFLOWPATH_HOLDER:' + tool_path \
            + ':g\" -e \"s:SCRIPTPATH_HOLDER:' + datuner_path \
            + ':g\" ' + src_file + ' > ' + workspace + '/tune_' + args.tool + '.py'
  os.system(sedcmd)

elif args.tool == 'vivado':
  src_file = datuner_path + '/eda_flows/' + args.tool
  if tune_cst == 1:
    src_file = src_file + '/tune_vivado_cst.py'
  else:
    src_file = src_file + '/tune_vivado.py'
  sedcmd = 'sed -e \"s:BENCH_HOLDER:' + design \
          + ":g\" -e \"s:WORKSPACE_HOLDER:" + workspace \
          + ':g\" -e \"s:TOPMODULE_HOLDER:' + top_module \
          + ':g\" -e \"s:SCRIPTPATH_HOLDER:' + datuner_path \
          + ':g\" -e \"s:DESIGNPATH_HOLDER:' + designdir \
          + ':g\" ' + src_file + ' > ' + workspace + '/tune_' + args.tool + '.py'
  os.system(sedcmd)

elif args.tool == "quartus":
  src_file = datuner_path + '/eda_flows/' + args.tool + '/tune_' + args.tool + '.py'
  sedcmd = 'sed -e \"s:BENCH_HOLDER:' + design + \
           ':g\" -e \"s:WORKSPACE_HOLDER:' + workspace + \
           ':g\" -e \"s:TOPMODULE_HOLDER:' + top_module + \
           ':g\" -e \"s:SCRIPTPATH_HOLDER:' + datuner_path + \
           ':g\" -e \"s:DESIGNPATH_HOLDER:' + designdir + \
           ':g\" ' + src_file + " > " + workspace + '/tune_' + args.tool + '.py'
  os.system(sedcmd)

else:
  src_file = py_code
  sedcmd = 'sed -e \"s:BENCH_HOLDER:' + design + \
            ':g\" -e \"s:WORKSPACE_HOLDER:' + workspace + \
            ':g\" -e \"s:SCRIPTPATH_HOLDER:' + datuner_path + \
            ':g\" ' + src_file + ' > ' + workspace + '/tune_program.py'
  os.system(sedcmd)
  cpcmd = 'cp ' + datuner_path + '/eda_flows/user_program_example/programWrapper.py ' + workspace
  cpcmd += '; cp ' + datuner_path + '/adddeps.py ' + workspace
  cpcmd += '; cp -r ' + datuner_path + '/eda_flows/custom/* ' + workspace
  os.system(cpcmd)
  os.system('echo \"vsrc = ' + design + '.v\" >> ' + workspace + '/flow/Makefrag')


#---------------------------
# Run DATuner
#---------------------------
os.chdir(workspace)
try:
  os.remove("log")
  shutil.rmtree("opentuner.db")
except:
  pass

# copy the files to remote nodes
host_file = open(datuner_path + "/my_hosts")
if len(host_file.readlines()) == 1:
  pass
else:
  host_file = open(datuner_path + "/my_hosts")
  next(host_file)
  for host_item in host_file:
    host_item = host_item.strip('\n')
    username = getpass.getuser()
    check_cmd = "ssh " + username + "@" + host_item + " \"[ -d " +workspace + " ] || "
    check_cmd += "mkdir -p " + workspace + "\""
    os.system(check_cmd + " > /dev/null")    
    copy_cmd = "scp " + workspace + "/* " + username + "@" + host_item + ":" + workspace
    os.system(copy_cmd + " > /dev/null")
    
mpi_path = "mpirun"

if args.tool == "vtr" or args.tool == "vivado" or args.tool == "quartus":
  runcmd = mpi_path + " -np 1 " + \
    "./DATuner_master -" + args.tool + " --test-limit " + str(args.limit) + " --stop-after " + \
    str(stoptime) + " --path " + workspace + " : -np " + str(proc_num) + " --hostfile " + \
    datuner_path + "/my_hosts " + "./DATuner_worker -design " + design + " -path " + workspace + \
    " -tune_cst " + str(tune_cst) + " --parallelism=1 "
  os.system(runcmd)
else:
  runcmd = mpi_path + " -np 1 " + \
      "./DATuner_master --space " + workspace + '/' + space_file_name + " --path " + workspace + \
      " --test-limit " + str(args.limit) + \
      " --stop-after " + str(stoptime) + " : -np " + str(proc_num) + " --hostfile " + \
      datuner_path + "/my_hosts " + "./DATuner_worker -design " + design + " -path " + workspace + \
      " --parallelism=1 >log"
  os.system(runcmd)
