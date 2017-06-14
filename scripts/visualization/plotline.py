import matplotlib.pyplot as plt
from pylab import *
import numpy as np
import sys
import readdata
from readdata import *

def plot_acu_line(ax,dir,proc):
  index = 0;
  y = []
  best_y = []
  length=0
  for ix in range(proc):
    tmp_y = []
    tmp_besty = []
    filename = dir+'/result_'+str(ix+1)+'.txt'
    read_result(filename,tmp_y,tmp_besty)
    if len(tmp_y) == 0:
      continue
    if len(tmp_y) > length:
      length = len(tmp_y)
    y.append(tmp_y)
    best_y.append(tmp_besty)

  avg_y = []
  best_acu_y = []
  best_acu = 0
  avg_acu_y = []
  avg_acu = 0
  for ix in range(length):
    tmp_avg = 0
    tmp_best = 0
    num = 0
    for iy in range(len(y)):
      if ix < len(y[iy]):
        num+=1
        if num == 1:
          tmp_best = y[iy][ix]
        if tmp_best < y[iy][ix]:
          tmp_best = y[iy][ix]
        tmp_avg += y[iy][ix]
    tmp_avg = tmp_avg/num
    avg_y.append(tmp_avg)

    if ix == 0:
      best_acu = tmp_best
      avg_acu  = tmp_avg

    if best_acu > tmp_best:
      best_acu = tmp_best
    if avg_acu > tmp_avg:
      avg_acu = tmp_avg
    best_acu_y.append(best_acu)
    avg_acu_y.append(avg_acu)

  ax.plot(best_acu_y,label='DATuner (best)',marker='D',color='black',linestyle='-', markevery=20,markersize=3)
  ax.plot(avg_acu_y,label='DATuner (avg)',marker='o',color='blue',linestyle=':',markevery=20,markersize=3)




