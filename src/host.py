import sys, os, socket, pickle, subprocess, sqlite3, dispy, time
from datetime import datetime
from threading import Thread
from config import *
from space_partition import *

# a list of all design points explored so far. Format of a design point:
# [[['param1', value1], ['param2', value2], ...], qor]
global_result = []

# a list of all the subspaces, format of a subspace:
# [[type, name, ['param1', range], ['param2', range], ...], socre, frequency]
# 'frequency': number of times the subspace has been explored so far
subspaces = []

def start_host():
  # add the initial space and a score of 0 and a frequency of 1
  subspaces.append([space, 0, 1])

  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  conn.bind(server_address)
  conn.listen(128)

  start_time = datetime.now()
  start_time_str = str(start_time.date()) + ' ' + str(start_time.time())

  # connect to database and create table is results table doesn't exist
  dbconn = sqlite3.connect('results_test' + '.db')
  c = dbconn.cursor()

  best_res, total_search_count = 1e9, 0
  while True:
    # Wait for a connection
    connection, client_address = conn.accept()
    data = pickle.loads(connection.recv(2048))
    if data[0] == 'init':
      total_search_count += 1
      client_space = select_space(total_search_count, subspaces, global_result)
      connection.send(pickle.dumps(client_space))
    elif data[0] == 'respond':
      if sweep:
        cfg, sweepparam, metadata, res = data[1:-3], data[-3], data[-2], data[-1]
        comb_alut = metadata[0]
        mem_alut = metadata[1]
        reg = metadata[2]
        bram = metadata[3]
        dsp = metadata[4]
        global_result.append([cfg, res])
        c.execute('INSERT INTO ' + dbtablename +''' VALUES 
          (''' + str(sweepparam) + ''', ''' + str(res) + ''',
          ''' + str(comb_alut) + ''',''' + str(mem_alut) + ''',
          ''' + str(reg) + ''',''' + str(mem_alut) + ''',
          ''' + str(dsp) + ''',''' + "'" + start_time_str + "'" + ''')''')
        print("Sweepparam complete: " + sweepparam + '\n')
        dbconn.commit()
      else:
        cfg, metadata, res = data[1:-2], data[-2], data[-1]
        if res < best_res:  
          best_res = res
        global_result.append([cfg, res])
        with open("global_result.txt", "a") as f:
          f.write(','.join(str(i) for i in (cfg + metadata)) + ',' + str(best_res) + '\n')
    elif data[0] == 'partition':
      partition_space(subspaces, global_result)
    elif data[0] == 'terminate':
      if sweep:
        t = (start_time_str,)
        for result in c.execute('SELECT * FROM ' + dbtablename + ' WHERE start_time=? ORDER BY sweepparam', t):
          print result
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

def worker_function(workspace, run_id, flow, space):
  import subprocess, sys, os, time, pickle
  os.system('mkdir -p ' + str(run_id))
  os.system('cp package.zip ' + str(run_id))
  os.chdir(os.getcwd() + '/' + str(run_id))
  os.system('unzip -o package.zip')
  os.system('rm package.zip')
  os.chdir(os.getcwd() + '/' + flow)
  pickle.dump(space, open('space.p', 'wb'))
  os.system('python tune.py --test-limit=1')
  sweepparam, res, metadata = param = pickle.load(open('result.p', 'rb'))
  return [sweepparam, res, metadata]

# Setup the results database and sweep points
# connect to database and create table is results table doesn't exist
dbconn = sqlite3.connect('results_test' + '.db')
c = dbconn.cursor()
c.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=\'" + dbtablename + "\'")
table_exists = c.fetchone()
if table_exists is None:
  c.execute('CREATE TABLE ' + dbtablename + ''' (sweepparam int, slack real, comb_alut int, 
    mem_alut int, reg int, bram int, dsp int, start_time text)''')

# Remove sweep points that have already been computed
if not overwrite:
  for swept in c.execute('SELECT sweepparam FROM ' + dbtablename):
    if str(swept[0]) in space[-1][2]:
      space[-1][2].remove(str(swept[0]))

dbconn.close()

if len(space[-1][2]) > 0:
  # # launch the host program on local machine
  # host_thread = Thread(target=start_host)
  # host_thread.start()

  if sweep: 
    start_time = datetime.now()
    start_time_str = str(start_time.date()) + ' ' + str(start_time.time())

    # connect to database and create table is results table doesn't exist
    dbconn = sqlite3.connect('results_test' + '.db')
    c = dbconn.cursor()

    print 'Number of sweeps: ' + str()
    numsweeps = len(space[-1][2])
    sweeps_completed = 0
    runs = numsweeps/budget

    # Create a zip package with the necessary design and python files
    os.system('rm package.zip')
    os.system('cp ' + genfile + ' ' + flow + '/design')
    os.system('cp tune.py ' + flow)
    os.system('cp config.py ' + flow)
    os.system('cp space_partition.py ' + flow)
    os.system('zip -r package ' + flow)
    os.system('rm ' + flow + '/tune.py')
    os.system('rm ' + flow + '/config.py')
    os.system('rm ' + flow + '/space_partition.py')
    os.system('rm ' + flow + '/design/' + genfile)

    # Initialize the job scheduler
    # The dependence file is automatically sent to remote servers
    cluster = dispy.JobCluster(worker_function, depends = ['package.zip'])

    # copy files to and start up dispynode.py on worker machines
    for i in range(budget):
      machine_addr = machines[i % len(machines)]

      subprocess.call(['scp', 'dispynode.py', user + '@' + machine_addr + ':' +workspace]);
      subprocess.Popen(['ssh', user + '@' + machine_addr, 'cd ' + workspace + \
        '; python dispynode.py --serve 1 --clean --dest_path_prefix dispytmp_' + str(i)])

    # Wait for the last node to be ready
    time.sleep(3)

    # send jobs to queue
    jobs = []
    for i in range(numsweeps):
      selected_space = copy.deepcopy(space)
      selected_space[-1][2] = [space[-1][2][i]]
      job = cluster.submit(workspace, i, flow, selected_space)
      job.id = i # optionally associate an ID to job (if needed later)
      jobs.append(job)


    cluster.wait() # waits for all scheduled jobs to finish
    
    # Save results
    for job in jobs:
      sweepparam, res, metadata = job.result
      comb_alut = metadata[0]
      mem_alut = metadata[1]
      reg = metadata[2]
      bram = metadata[3]
      dsp = metadata[4]
      c.execute('INSERT INTO ' + dbtablename +''' VALUES 
        (''' + str(sweepparam) + ''', ''' + str(res) + ''',
        ''' + str(comb_alut) + ''',''' + str(mem_alut) + ''',
        ''' + str(reg) + ''',''' + str(mem_alut) + ''',
        ''' + str(dsp) + ''',''' + "'" + start_time_str + "'" + ''')''')
      print("Sweepparam complete: " + sweepparam + '\n')
      dbconn.commit()

    # Print results
    t = (start_time_str,)
    for result in c.execute('SELECT * FROM ' + dbtablename + ' WHERE start_time=? ORDER BY sweepparam', t):
      print result

    dbconn.close()
    cluster.print_status()
    cluster.close()
  else:
    runs_per_epoch = 1
    epoch = budget / runs_per_epoch

    for e in range(epoch):
      p = []
      for i in range(budget/epoch):
        machine_addr = machines[i % len(machines)]
        ws_id = workspace + '/' + str(i)
        subprocess.call(['ssh', machine_addr, 'mkdir -p ' + ws_id]);
        os.system('scp -r ./' + flow + ' ' + machine_addr + ':' + ws_id)
        subprocess.call(['scp', 'tune.py', machine_addr + ':' +ws_id +'/'+flow]);
        subprocess.call(['scp', 'config.py', machine_addr + ':' +ws_id +'/'+flow]);
        subprocess.call(['scp', 'space_partition.py', machine_addr + ':' +ws_id +'/'+flow]);
        p.append(subprocess.Popen(['ssh', machine_addr, 'cd ' + ws_id + \
                              '/' + flow + '; python tune.py --test-limit=1']))
      [process.wait() for process in p]

      # send request to host to partition the space
      send_simple_msg_to_host('partition')

  # # terminate the host
  # send_simple_msg_to_host('terminate')

  # host_thread.join()
else:
  print "No sweeps to run"