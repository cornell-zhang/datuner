import matplotlib.pyplot as plt
from pylab import *
import numpy as np
import sys

def readVivado(dir, y,best_y,best_cfg,design,rank, length=1000):
  f = open(dir+design+'/result'+str(rank)+'.txt','r')
  best=-10000
  ic = 0
  bestid = 0
  tmp = []
  while 1:
    line = f.readline()
    if not line: break
    bufs = line.split()
    wns = float(bufs[24])
    y.append(wns)
    if wns > best:
      best = wns
    best_y.append(best)
    ic += 1
    if ic > length: break
  f.close()

def readVTR(dir,y,best_y,best_cfg,design,rank,length=1000):
  
  filename=dir+design+'/result_'+str(rank)+'.txt'
  import os.path
  if os.path.isfile(filename) == False:
    return
  f = open(dir+design+'/result_'+str(rank)+'.txt','r')

  requestor = []
  best=-10000
  ic = 0
  bestid = 0
  tmp = []
  while 1:
    line = f.readline()
    if not line: break
    bufs = line.split()
    if line.find("abcConfig") == -1 and line.find("vprConfig") == -1:
      if len(bufs) > 13:
        if bufs[13] == "default":
          requestor.append("NormalGreedyMutation")
        else:
          requestor.append(bufs[13])
      else:
        requestor = []
      wns = float(bufs[4])
      y.append(wns)
      if wns > best:
        tmp = []
        best = wns
        bestid = ic
      best_y.append(best)
      ic += 1
      if ic > length: break
  f.close()
  best_cfg[:] = tmp[:]
  return bestid


#def readVivado(y,best_y,best_cfg,design,length=1000):
#  dir = '/work/zhang/users/chang/project/opentuner/iccad-16/vivado-data/baseline/data/'
#  f = open(dir+design+'_result.txt','r')
#  while 1:
#    line = f.readline()
#    if not line: break
#    if line.find("abcConfig") == -1 and line.find("vprConfig") == -1:
#        bufs = line.split()
#        wns = float(bufs[tarid])
#        y[id].append(wns)
#        if wns > best:
#          best = wns
#        best_y[id].append(best)
#        ic += 1
#        if ic > length: break
#    f.close()
#    print ic

