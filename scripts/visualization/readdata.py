import matplotlib.pyplot as plt
from pylab import *
import numpy as np
import sys
import os.path

def read_result(filename, y, best_y, length=1000):
  if os.path.isfile(filename) == False:
    print filename+" not found. Please check...\n"
    return
  f = open(filename, 'r')
  best= 0
  ic = 0
  tmp = []
  while 1:
    line = f.readline()
    if not line: break
    line = line[:-1]
    bufs = line.split()
    score = float(bufs[-1])
    y.append(score)
    if ic == 0:
      best = score
    if score < best:
      best = score
    best_y.append(best)
    ic += 1
    if ic > length: break
  f.close()


