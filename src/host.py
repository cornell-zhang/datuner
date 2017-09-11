import sys
import socket
import pickle
import subprocess
from threading import Thread

space = [
  ['EnumParameter', 'index', range(1000)]
]

budget = 4
workspace = '/work/zhang/users/liu/datuner/workspace'
server_address = ('128.253.128.53', 10000)

machines = [
  'gl387@zhang-01.ece.cornell.edu',
#  'gl387@zhang-06.ece.cornell.edu'
]

source_files = [
  'sample.py',
  'tune_sample.py'
]

global_result = []

def start_host():
  # Create a TCP/IP socket
  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  
  # Bind the socket to the port
  print >>sys.stderr, 'starting up on %s port %s' % server_address
  conn.bind(server_address)
  
  # Listen for incoming connections
  conn.listen(8)
  
  best_res = 1e9
  while True:
    # Wait for a connection
    connection, client_address = conn.accept()
    data = pickle.loads(connection.recv(2048))
    if data[0] == 'init':
      print >>sys.stderr, 'waiting for a connection'
      connection.send(pickle.dumps(space))
    elif data[0] == 'respond':
      data = data[1:]
      res = data[-1]
      if res < best_res:
        best_res = res
      global_result.append(data)
      with open("global_result.txt", "a") as f:
        f.write(','.join(str(i) for i in data) + ',' + str(best_res) + '\n')
    elif data[0] == 'terminate':
      connection.close()
      break
    else:
      print "Unknown protocol message: " + mode + '\n'

# launch the host program on local machine
host_thread = Thread(target=start_host)
host_thread.start()

p = []
for i in range(budget):
  # launch the tuning program on the worker machines
  machine_id = i % len(machines)
  machine_addr = machines[machine_id]
  # make a directory under workspace for instance i
  subprocess.call(['ssh', machine_addr, 'mkdir -p ' + workspace + '/' + str(i)]);
  # copy files to the directory
  for item in source_files:
    subprocess.call(['scp', item, machine_addr + ':' + workspace + '/' + str(i)]);
  # run the tunning program 
  p.append(subprocess.Popen(['ssh', machine_addr, 'cd ' + workspace + '/' + str(i) + '; python tune_sample.py --test-limit=10']))

# wait for all workers to finish
[process.wait() for process in p]

# terminate the host
conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
conn.connect(server_address)
conn.send(pickle.dumps(['terminate']))
conn.close()

host_thread.join()
