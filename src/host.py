#!/usr/bin/python

#===================================================
# run DATuner
#===================================================

import sys, os, argparse, socket, pickle, subprocess, sqlite3, dispy, time
from threading import Thread
from datetime import datetime

DATUNER_HOME = os.environ['DATUNER_HOME']

sys.path.append(DATUNER_HOME + '/src')
pwd = os.getcwd()
sys.path.append(pwd)

from space_partition import *

#-------------------------------------------------
# parse parameters and read information from py
#-------------------------------------------------
parser = argparse.ArgumentParser(description='main script for DATuner')
parser.add_argument('-f', '--flow', type=str, dest='tool', choices=['vtr','vivado','quartus','custom'])
parser.add_argument('-b', '--budget', type=int, default=1, dest='limit')
parser.add_argument('-t', '--timeout', type=str, default='0.0d:0.0h:0.0m:7200.0s', dest='stop', help='format: 4d:2h:5m:9s')
parser.add_argument('-p', '--parallel', type=int, default=1, dest='pf')
args = parser.parse_args()

flow = args.tool
budget = args.limit
proc_num = args.pf

if len(sys.argv) < 2:
  parser.print_help()
  sys.exit(1)

if os.path.exists(pwd + '/vtr.py') and flow == 'vtr':
  import vtr
  tool_path = eval(flow + '.tool_path')
elif os.path.exists(pwd + '/vivado.py') and flow == 'vivado':
  import vivado
  top_module = eval(flow + '.top_module')
elif os.path.exists(pwd + '/quartus.py') and flow == 'quartus':
  # from quartus import server_address as server_address
  # from quartus import space as space
  # from quartus import designdir as designdir
  # from quartus import top_module as top_module
  from quartus import *
elif os.path.exists(pwd + '/custom.py') and flow == 'custom':
  from custom import server_address as server_address
  from custom import space as space
else:
  print "missing [tool_name].py under current folder"
  sys.exit(1)

print '[     0s]    INFO the current work space is: ' + pwd

#-------parameters check------
if flow == '':
  print "Please specify the tool name."
  sys.exit(1)

if flow == "vtr":
  if os.path.exists(tool_path+"/scripts") == False:
    print "vtr path is not correct. Please check. The path should to point to .../vtr/vtr_release/vtr_flow"
    sys.exit(1)
elif flow == 'vivado':
  if top_module == '':
    print "Vivado is used. Please specify the top module."
    sys.exit(1)
elif flow == 'quartus':
  if top_module == '':
    print "Quartus is used. Please specify the top module."
    sys.exit(1)

tune_cst = 0
if flow == 'vivado':
  if eval(flow + '.modify_cst') == 'y' or eval(flow + '.modify_cst') == 'yes':
    tune_cst = 1
    if eval(flow + '.tune_cst') == '':
      print "Please specify the default timing constraint."
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

#---------------------------
# Run DATuner
#---------------------------

# a list of all design points explored so far. Format of a design point:
# [[['param1', value1], ['param2', value2], ...], qor]
global_result = []

# a list of all the subspaces, format of a subspace:
# [[type, name, ['param1', range], ['param2', range], ...], socre, frequency]
# 'frequency': number of times the subspace has been explored so far
subspaces = []

# Generates a list of sweep param combinations; Recursive function
# The sweep param combos are stored in sweeplist
sweeplist = []
def sweep(sweepparams, sweepset):
  if not sweepparams:
    sweeplist.append(sweepset)
    return
  else:
    for param in sweepparams[0][1]:
      next_sp = sweepparams[:]
      del next_sp[0]
      next_sweepset = sweepset[:]
      next_sweepset.append([sweepparams[0][0], param])
      sweep(next_sp, next_sweepset)

def sweep_function(run_id, flow, sweep, enums, genfile, top_module):
  import subprocess, sys, os, time, pickle
  os.system('mkdir -p ' + str(run_id))
  os.system('cp package.zip ' + str(run_id))
  os.chdir('./' + str(run_id))
  os.system('unzip -o package.zip')
  os.system('rm package.zip')
  pickle.dump([enums, top_module], open('space.p', 'wb'))
  pickle.dump([sweep, genfile], open('sweep.p', 'wb'))
  os.system('python tune.py --test-limit=1')
  msg, metadata, res = pickle.load(open('result.p', 'rb'))
  return [sweep, res, metadata]

def tune_function(i, space, top_module):
  import os
  os.system('mkdir -p ' + str(i))
  os.system('cp package.zip ' + str(i))
  os.chdir('./' + str(i))
  os.system('unzip -o package.zip')
  os.system('rm package.zip')
  pickle.dump([space, top_module], open('space.p', 'wb'))
  os.system('python tune.py --test-limit=1')
  msg, metadata, res = pickle.load(open('result.p', 'rb'))
  return [msg, metadata, res]

# Extract the sweepparams
# Also checks to make sure that all other non sweep params are constant
sweepparams = []
sweepcnt = 1;
enum_not_fixed = False;
for param in space:
  if param[0] == 'SweepParameter':
    temp_param = copy.deepcopy(param)
    del temp_param[0]
    sweepparams.append(temp_param)
    sweepcnt *= len(temp_param[1])
  else:
    if len(param[2]) != 1:
      enum_not_fixed = True;
if enum_not_fixed and sweepcnt > 1:
  print 'Both enum parameters and sweep parameters not fixed. One must be fixed!'
  sys.exit()

if sweepcnt > 1: 
  start_time = datetime.now()
  start_time_str = str(start_time.date()) + ' ' + str(start_time.time())

  # Generate the list of sweep param combos
  # Combos are stored in sweeplist
  sweep(sweepparams, [])

  print 'Number of sweeps: ' + str()
  numsweeps = len(sweeplist)
  sweeps_completed = 0

  # Setup the results database and sweep points
  # connect to database and create table is results table doesn't exist
  dbfilename = 'results' # temp hard coding
  dbconn = sqlite3.connect(dbfilename + '.db')
  c = dbconn.cursor()
  c.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=\'" + dbtablename + "\'")
  table_exists = c.fetchone()
  if table_exists is None:
    # Generate the sweep parameter list string
    sweepparam_names = ""
    for param in sweepparams:
      sweepparam_names = sweepparam_names + param[0] + ' int, '
    c.execute('CREATE TABLE ' + dbtablename + ' (' + sweepparam_names + '''slack real, 
      comb_alut int, mem_alut int, reg int, bram int, dsp int, start_time text)''')

  # Remove sweep points that have already been computed
  # This is broken after implementation of variable number of sweepparams
  # if not overwrite:
  #   for swept in c.execute('SELECT sweepparam FROM ' + dbtablename):
  #     if str(swept[0]) in space[-1][2]:
  #       space[-1][2].remove(str(swept[0]))

  dbconn.close()

  # Create a zip package with the necessary design and python files
  os.system('rm package.zip')
  os.system('rm -rf files')
  os.system('mkdir files')
  os.system('cp ' + DATUNER_HOME + '/src/tune.py files')
  os.system('cp ' + DATUNER_HOME + '/flows/' + flow + '/* files')
  os.system('cp ' + flow + '.py files')
  os.system('mkdir files/design')
  os.system('cp -R ' + designdir + '/* files/design')
  os.system('cd files; zip -r ../package.zip *')

  # Initialize the job scheduler
  # The dependence file is automatically sent to remote servers
  cluster = dispy.JobCluster(sweep_function, depends = ['package.zip'])

  # copy files to and start up dispynode.py on worker machines
  # this can be removed from release code if we assume users manually start dispy
  for i in range(len(machines)):
    machine_addr = machines[i % len(machines)]

    subprocess.call(['scp', 'dispynode.py', user + '@' + machine_addr + ':' +workspace]);
    subprocess.Popen(['ssh', user + '@' + machine_addr, 'cd ' + workspace + \
      '; python dispynode.py --serve 1 --clean --dest_path_prefix dispytmp_' + str(i)])

  # Wait for the last node to be ready
  time.sleep(3)

  # send jobs to queue
  jobs = []
  for i in range(numsweeps):
    selected_sweep = sweeplist[i]
    job = cluster.submit(i, flow, selected_sweep, space, genfile, top_module)
    job.id = i # optionally associate an ID to job (if needed later)
    jobs.append(job)


  cluster.wait() # waits for all scheduled jobs to finish

  # Generate the sweep parameter list name string
  # We are assuming that the ordering of sweep params are the same in sweepparams
  # and elements of sweelist. This should always hold true unless the worker
  # function modifies the sweep
  # This can be fixed using pattern matching
  sweepparam_names = ""
  for param in sweepparams:
    sweepparam_names = sweepparam_names + param[0] + ', '
  column_names = '(' + sweepparam_names + '''slack, comb_alut, mem_alut, reg, 
    bram, dsp, start_time)'''
  
  # reconnect to database to save results
  dbconn = sqlite3.connect(dbfilename + '.db')
  c = dbconn.cursor()

  # Save results
  for job in jobs:
    sweep, res, metadata = job.result
    comb_alut = str(metadata[0]).replace(',','')
    mem_alut = str(metadata[1]).replace(',','')
    reg = str(metadata[2]).replace(',','')
    bram = str(metadata[3]).replace(',','')
    dsp = str(metadata[4]).replace(',','')
    # Generate the sweep parameter list value strings
    sweepparam_vals = ""
    for param in sweep:
      sweepparam_vals = sweepparam_vals + param[1] + ', '
    c.execute('INSERT INTO ' + dbtablename + ' ' + column_names + ''' VALUES 
      (''' + sweepparam_vals + str(res) + ''',
      ''' + str(comb_alut) + ''',''' + str(mem_alut) + ''',
      ''' + str(reg) + ''',''' + str(bram) + ''',
      ''' + str(dsp) + ''',''' + "'" + start_time_str + "'" + ''')''')
    print("Sweepparam complete: " + str(sweep) + '\n')
    dbconn.commit()

  # Print results
  t = (start_time_str,)
  for result in c.execute('SELECT * FROM ' + dbtablename + ' WHERE start_time=? ORDER BY ' + sweepparams[0][0], t):
    print result

  dbconn.close()
  cluster.print_status()
  cluster.close()
else:
  dbconn = sqlite3.connect('results' + '.db')
  dbcursor = dbconn.cursor()
  dbcursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=\'res\'")
  table_exists = dbcursor.fetchone()
  if table_exists is None:
    cfg_list = []
    for i in space:
      cfg_list.append(i[1] + ' text')
    dbcursor.execute('CREATE TABLE res (' + ','.join(cfg_list) + ', QoR real)')

  os.system('rm package.zip')
  os.system('rm -rf files')
  os.system('mkdir files')
  os.system('cp ' + DATUNER_HOME + '/src/tune.py files')
  os.system('cp ' + DATUNER_HOME + '/flows/' + flow + '/* files')
  os.system('cp ' + flow + '.py files')
  os.system('mkdir files/design')
  os.system('cp -R ' + designdir + '/* files/design')
  os.system('cd files; zip -r ../package.zip *')
  cluster = dispy.JobCluster(tune_function, depends = ['package.zip'])

  runs_per_epoch = 4
  epoch = budget / runs_per_epoch

  # add the initial space and a score of 0 and a frequency of 1
  subspaces.append([space, 0, 1])

  best_res, total_search_count = 1e9, 0

  for e in range(epoch):
    jobs = []
    for i in range(budget/epoch):
      total_search_count += 1
      job = cluster.submit(i, select_space(total_search_count, subspaces, global_result), top_module)
      job.id = i
      jobs.append(job)
    
    cluster.wait()

    # Save results
    for job in jobs:
      cfg, metadata, res = job.result
      if res < best_res:  
        best_res = res
      global_result.append([cfg, res])
      cfg_val = []
      for space_iter in space:
        cfg_name = space_iter[1]
        for i in cfg[0]:
          if cfg_name == i[0]:
            cfg_val.append(str(i[1]))
            break
      # TODO: There is a syntax error with the sql command
      # OperationalError: near "on": syntax error
      # dbcursor.execute('INSERT INTO res VALUES (' + ','.join(cfg_val) + ',' + str(res) + ')')
      # dbconn.commit()
      with open("global_result.txt", "a") as f:
        f.write(','.join(str(i) for i in (cfg + metadata)) + ',' + str(best_res) + '\n')

    # send request to host to partition the space
    partition_space(subspaces, global_result)

  # terminate the host
  dbconn.close()
