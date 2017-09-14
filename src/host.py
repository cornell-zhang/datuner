import sys
import socket
import pickle
import subprocess
import os
import math
import copy
from threading import Thread
from config import *

global_result = []
subspaces = []

def check_design_point_in_space(design_point, target_space):
  for i in design_point[0]:
    for j in target_space:
      if i[0] == j[1]:
        if j[0] == 'EnumParameter':
          if (not i[1] in j[2]):
            return False
          else:
            break
  return True


def calculate_conditional_entropy(target_space, dimension, average_qor):
  conditional_entropy = 0
  values = dimension[2]
  for value in values:
    # for each value of dimension, formulate a subspace with the specific value on dimension
    target_subspace = copy.deepcopy(target_space)
    for i in target_subspace:
      if i[1] == dimension[1]:
        i[2] = [value]
        break
    # evaluate design points in target_subspace
    num_pts = 0
    num_good_pts = 0
    num_bad_pts = 0
    for design_point in global_result:
      if check_design_point_in_space(design_point, target_subspace):
        num_pts += 1
        if design_point[-1] <= average_qor: num_good_pts += 1
        else: num_bad_pts += 1

    if num_pts == 0:
      continue

    num_pts = float(num_pts)
    num_good_pts = float(num_good_pts)
    num_bad_pts = float(num_bad_pts)
    # calculate the entropy of target_subspace
    if num_good_pts > 0:
      entropy_good_pts = -(num_good_pts/num_pts * math.log(num_good_pts/num_pts))
    else:
      entropy_good_pts = 0
    if num_bad_pts > 0:
      entropy_bad_pts = -(num_bad_pts/num_pts * math.log(num_bad_pts/num_pts))
    else:
      entropy_bad_pts = 0
    target_subspace_entropy = entropy_good_pts + entropy_bad_pts
    # accumulate to the overall coonditional_entropy
    conditional_entropy += num_pts * target_subspace_entropy

  return conditional_entropy    

def select_dimension(target_space):
  sum_qor = 0
  for i in global_result:
    sum_qor += i[-1]
  average_qor = float(sum_qor) / len(global_result)

  best_conditional_entropy = 1e9

  for dimension in target_space:
    conditional_entropy = calculate_conditional_entropy(target_space, dimension, average_qor)
    if conditional_entropy < best_conditional_entropy:
      best_conditional_entropy = conditional_entropy
      target_dimension = dimension[1]

  return target_dimension
  


def partition_space():
  # select the subspace with the highest score to partition
  best_score = -1e9
  for space_tuple in subspaces:
    if space_tuple[1] > best_score:
      best_score = space_tuple[1]
      target_space = space_tuple[0]
      target_freq = space_tuple[2]
      target_space_tuple = space_tuple

  dimension_to_partition = select_dimension(target_space)

  # partition dimension 'x' of target_space
  # get the values of 'x'
  for dimension in target_space:
    if dimension[1] == dimension_to_partition:
      values = dimension[2]
      break

  # for each value of 'x', create a subspace and add to subspaces
  for value in values:
    target_space_copy = copy.deepcopy(target_space)
    for dimension in target_space_copy:
      if dimension[1] == dimension_to_partition:
        dimension[2] = [value]
        break
    subspaces.append([target_space_copy, 0, target_freq])

  # remove the original target_space
  subspaces.remove(target_space_tuple)


def update_score(t):
  for space_tuple in subspaces:
    num_points = 0
    total_qor = 0
    for design_point in global_result:
      if check_design_point_in_space(design_point, space_tuple[0]):
        num_points += 1
        total_qor += -design_point[1]
    if num_points == 0:
      space_tuple[1] = math.sqrt(2*math.log(t)/space_tuple[2])
    else:
      space_tuple[1] = total_qor / num_points + math.sqrt(2*math.log(t)/space_tuple[2])

def select_space(t):
  update_score(t)
  best_score = -1e9
  for space_tuple in subspaces:
    if space_tuple[1] > best_score:
      best_score = space_tuple[1]
      best_space = space_tuple[0]
      best_space_tuple = space_tuple
  best_space_tuple[2] += 1
  return best_space

def start_host():
  # add the initial space and a score of 0 and a frequency of 1
  subspaces.append([space, 0, 1])

  # Create a TCP/IP socket
  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  
  # Bind the socket to the port
  conn.bind(server_address)
  
  # Listen for incoming connections
  conn.listen(8)
  
  best_res = 1e9
  total_search_count = 0
  while True:
    # Wait for a connection
    connection, client_address = conn.accept()
    data = pickle.loads(connection.recv(2048))
    if data[0] == 'init':
      print subspaces
      print >>sys.stderr, 'waiting for a connection'
      total_search_count += 1
      connection.send(pickle.dumps(select_space(total_search_count)))
    elif data[0] == 'respond':
      data = data[1:]
      res = data[-1]
      if res < best_res:  best_res = res
      global_result.append(data)
      with open("global_result.txt", "a") as f:
        f.write(','.join(str(i) for i in data) + ',' + str(best_res) + '\n')
    elif data[0] == 'partition':
      partition_space()
    elif data[0] == 'terminate':
      connection.close()
      break
    else:
      print "Unknown protocol message: " + mode + '\n'

# launch the host program on local machine
host_thread = Thread(target=start_host)
host_thread.start()

epoch = budget/2

for e in range(epoch):
  p = []
  for i in range(budget/epoch):
    machine_addr = machines[i % len(machines)]
    subprocess.call(['ssh', machine_addr, 'mkdir -p ' + workspace + '/' + str(i)]);
    os.system('scp -r ./' + flow + ' ' + machine_addr + ':' + workspace + '/' + str(i))
    subprocess.call(['scp', 'tune.py', machine_addr + ':' + workspace + '/' + str(i) + '/' + flow]);
    subprocess.call(['scp', 'config.py', machine_addr + ':' + workspace + '/' + str(i) + '/' + flow]);
    p.append(subprocess.Popen(['ssh', machine_addr, 'cd ' + workspace + '/' + 
              str(i) + '/' + flow + '; python tune.py --test-limit=10']))
  [process.wait() for process in p]
  # send request to host to partition the space
  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  conn.connect(server_address)
  conn.send(pickle.dumps(['partition']))
  conn.close()
  

# terminate the host
conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
conn.connect(server_address)
conn.send(pickle.dumps(['terminate']))
conn.close()

host_thread.join()
