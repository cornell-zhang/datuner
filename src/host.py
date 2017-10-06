import sys, os, socket, pickle, subprocess
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

  best_res, total_search_count = 1e9, 0
  while True:
    # Wait for a connection
    connection, client_address = conn.accept()
    data = pickle.loads(connection.recv(2048))
    if data[0] == 'init':
      total_search_count += 1
      if sweep:
        client_space = select_space_for_sweep(total_search_count, space)
      else:
        client_space = select_space(total_search_count, subspaces, global_result)
      connection.send(pickle.dumps(client_space))
      print str(client_space)
      #print "Sent " + + " to client"
    elif data[0] == 'respond':
      cfg, metadata, res = data[1:-2], data[-2], data[-1]
      comb_alut = metadata[0]
      mem_alut = metadata[1]
      reg = metadata[2]
      bram = metadata[3]
      dsp = metadata[4]
      if res < best_res:  
        best_res = res
      global_result.append([cfg, res])
      with open("global_result.txt", "a") as f:
        f.write(','.join(str(i) for i in (cfg + metadata)) + ',' + '\n')
        f.write("Slack: " + str(res) + ", ")
        f.write("Comb Alut: " + str(comb_alut) + ", ")
        f.write("Mem Alut: " + str(mem_alut) + ", ")
        f.write("Reg: " + str(reg) + ", ")
        f.write("BRAM: " + str(bram) + ", ")
        f.write("DSP: " + str(dsp) + ", " + '\n')
        print("Sweepparam complete: " + str(cfg[len(cfg) - 1]) + '\n')
    elif data[0] == 'partition':
      partition_space(subspaces, global_result)
    elif data[0] == 'terminate':
      connection.close()
      conn.close()
      break
    else:
      print "Unknown protocol message: " + mode + '\n'

def send_simple_msg_to_host(msg):
  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  conn.connect(server_address)
  conn.send(pickle.dumps([msg]))
  conn.close()

# launch the host program on local machine
host_thread = Thread(target=start_host)
host_thread.start()

if sweep:
  numsweeps = len(space[len(space) - 1][2])
  sweeps_completed = 0
  runs = numsweeps/budget

  for r in range(runs):
    p = []
    for i in range(budget):
      machine_addr = machines[i % len(machines)]
      ws_id = workspace + '/' + str(i)
      print 'Destination: ' + machine_addr + ':' + ws_id
      print 'Flow: ' + flow
      subprocess.call(['ssh', machine_addr, 'mkdir -p ' + ws_id]);
      os.system('scp -r ./' + flow + ' ' + machine_addr + ':' + ws_id)
      subprocess.call(['scp', 'tune.py', machine_addr + ':' +ws_id +'/'+flow]);
      subprocess.call(['scp', 'config.py', machine_addr + ':' +ws_id +'/'+flow]);
      subprocess.call(['scp', 'space_partition.py', machine_addr + ':' +ws_id +'/'+flow]);
      p.append(subprocess.Popen(['ssh', machine_addr, 'cd ' + ws_id + \
                            '/' + flow + '; python tune.py --test-limit=1']))
    [process.wait() for process in p]
else:
  runs_per_epoch = 1
  epoch = budget / runs_per_epoch

  for e in range(epoch):
    p = []
    for i in range(budget/epoch):
      machine_addr = machines[i % len(machines)]
      ws_id = workspace + '/' + str(i)
      print 'Destination: ' + machine_addr + ':' + ws_id
      print 'Flow: ' + flow
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



# terminate the host
send_simple_msg_to_host('terminate')

host_thread.join()
