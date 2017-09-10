import sys
import socket
import pickle

space = [
  ['EnumParameter', 'index', range(1000)]
]

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
  connection, client_address = conn.accept()
  try:
    data = pickle.loads(connection.recv(2048))
    if data[0] == 'init':
      print >>sys.stderr, 'waiting for a connection'
      connection.send(str(len(space)))
      for param in space:
        data_string = pickle.dumps(param)
        connection.send(data_string)
    elif data[0] == 'respond':
      data = data[1:]
      with open("global_result.txt", "a") as f:
        f.write(','.join(str(i) for i in data) + '\n')
    else:
      print "wrong mode: " + mode + '\n'
  finally:
    connection.close()
