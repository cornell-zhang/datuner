import sys
import socket
import pickle

# Create a TCP/IP socket
conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
server_address = ('128.253.128.53', 10000)
print >>sys.stderr, 'starting up on %s port %s' % server_address
conn.bind(server_address)

# Listen for incoming connections
conn.listen(8)

while True:
  # Wait for a connection
  print >>sys.stderr, 'waiting for a connection'
  connection, client_address = conn.accept()
  try:
    data_string = pickle.dumps(['EnumParameter', 'index', range(1000)])
    connection.send(data_string)
  finally:
    connection.close()
