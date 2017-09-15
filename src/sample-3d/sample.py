import os
import sys
import numpy as np

def dataset(x, y, z):
  #return float(x) + float(y) + float(z)
  np.random.seed(1)
  rand_array = np.random.rand(100, 100, 100)
  return rand_array[int(x)][int(y)][int(z)]

def dump_result(qor):
  filename = 'qor.txt'
  f = open(filename, 'w')
  f.write(str(qor))
  f.close()

if __name__ == '__main__':
  x, y, z = sys.argv[1], sys.argv[2], sys.argv[3]
  qor = dataset(x, y, z)
  dump_result(qor)
