import re
import os
import sys
import optparse
import argparse
import getpass
import socket
import pickle

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
server_address = ('128.84.48.152', 10000)
print >>sys.stderr, 'starting up on %s port %s' % server_address
sock.bind(server_address)

# Listen for incoming connections
sock.listen(5)

#-------------------------------------------------
# parse parameters
#-------------------------------------------------
parser = argparse.ArgumentParser(description='main script for autotuning')
parser.add_argument('-i', '--index', type=int, default=1, dest='index')
parser.add_argument('-r', '--rank', type=int, default=1, dest='rank')
args = parser.parse_args()

index = str(args.index)
rank = str(args.rank)

while True:
  # Wait for a connection
  print >>sys.stderr, 'waiting for a connection'
  connection, client_address = sock.accept()
  try:
    connection.sendall('hello')
    #connection.sendall(rank)
  finally:
    connection.close()

