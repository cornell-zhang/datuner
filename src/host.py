#!/usr/bin/python

#===================================================
# run DATuner
#===================================================

import sys, os, argparse, socket, pickle, subprocess, sqlite3, dispy
from threading import Thread

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
  from quartus import server_address as server_address
  from quartus import space as space
  from quartus import designdir as designdir
  from quartus import top_module as top_module
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

def start_host():
  dbconn = sqlite3.connect('results' + '.db')
  dbcursor = dbconn.cursor()
  dbcursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=\'res\'")
  table_exists = dbcursor.fetchone()
  if table_exists is None:
    cfg_list = []
    for i in space:
      cfg_list.append(i[1] + ' text')
    dbcursor.execute('CREATE TABLE res (' + ','.join(cfg_list) + ', QoR real)')

  # add the initial space and a score of 0 and a frequency of 1
  subspaces.append([space, 0, 1])

  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  conn.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
  conn.bind(server_address)
  conn.listen(128)

  best_res, total_search_count = 1e9, 0
  while True:
    # Wait for a connection
    connection, client_address = conn.accept()
    data = pickle.loads(connection.recv(2048))
    if data[0] == 'init':
      total_search_count += 1
      connection.send(pickle.dumps(select_space(total_search_count, subspaces, \
                                                  global_result)))
    elif data[0] == 'respond':
      cfg, metadata, res = data[1:-2], data[-2], data[-1]
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
      dbcursor.execute('INSERT INTO res VALUES (' + ','.join(cfg_val) + ',' + str(res) + ')')
      dbconn.commit()
      with open("global_result.txt", "a") as f:
        f.write(','.join(str(i) for i in (cfg + metadata)) + ',' + str(best_res) + '\n')
    elif data[0] == 'partition':
      partition_space(subspaces, global_result)
    elif data[0] == 'terminate':
      connection.close()
      conn.close()
      dbconn.close()
      break
    else:
      print "Unknown protocol message: " + mode + '\n'

def send_simple_msg_to_host(msg):
  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  conn.connect(server_address)
  conn.send(pickle.dumps([msg]))
  conn.close()

def slave_function(i):
  import os
  os.system('mkdir -p ' + str(i))
  os.system('cp *.py ./' + str(i))
  os.chdir('./' + str(i))
  os.system('python tune.py --test-limit=1')
  return

# launch the host program on local machine
host_thread = Thread(target=start_host)
host_thread.start()

os.system('cp ' + DATUNER_HOME + '/src/tune.py .')
os.system('cp ' + DATUNER_HOME + '/flows/' + flow + '/* .')
cluster = dispy.JobCluster(slave_function, depends = ['tune.py', flow + '.py'] + \
          [f for f in os.listdir(DATUNER_HOME + '/flows/' + flow)])

runs_per_epoch = 4
epoch = budget / runs_per_epoch

for e in range(epoch):
  jobs = []
  for i in range(budget/epoch):
    job = cluster.submit(i)
    job.id = i
    jobs.append(job)
  
  cluster.wait()

  # send request to host to partition the space
  send_simple_msg_to_host('partition')

# terminate the host
send_simple_msg_to_host('terminate')

host_thread.join()
