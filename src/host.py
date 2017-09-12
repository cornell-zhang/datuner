import sys
import socket
import pickle
import subprocess
import os
from threading import Thread
from config import *

global_result = []

def start_host():
  # Create a TCP/IP socket
  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  
  # Bind the socket to the port
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
      if res < best_res:  best_res = res
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
  machine_addr = machines[i % len(machines)]
  subprocess.call(['ssh', machine_addr, 'mkdir -p ' + workspace + '/' + str(i)]);
  os.system('scp -r ./' + flow + ' ' + machine_addr + ':' + workspace + '/' + str(i))
  subprocess.call(['scp', 'tune.py', machine_addr + ':' + workspace + '/' + str(i) + '/' + flow]);
  subprocess.call(['scp', 'config.py', machine_addr + ':' + workspace + '/' + str(i) + '/' + flow]);
  p.append(subprocess.Popen(['ssh', machine_addr, 'cd ' + workspace + '/' + 
            str(i) + '/' + flow + '; python tune.py --test-limit=10']))

[process.wait() for process in p]

# terminate the host
conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
conn.connect(server_address)
conn.send(pickle.dumps(['terminate']))
conn.close()

host_thread.join()
