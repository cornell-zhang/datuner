import os
import sys

def dataset(x, y, z):
  return float(x) + float(y) + float(z)

def dump_result(qor):
  filename = 'qor.txt'
  f = open(filename, 'w')
  f.write(str(qor))
  f.close()

if __name__ == '__main__':
  x, y, z = sys.argv[1], sys.argv[2], sys.argv[3]
  qor = dataset(x, y, z)
  dump_result(qor)
