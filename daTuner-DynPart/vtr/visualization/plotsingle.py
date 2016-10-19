import matplotlib.pyplot as plt
from pylab import *
import numpy as np
import sys
import readdata
from readdata import *


def plot_acu_line(ax,design,dir,proc,mylabel,mymarker,mycolor,limit, target=1000, exp='my',width=1,type="raw",upval=0):

  index = 0;
  y = []
  best_y = []
  cfg = []
  
  length=0
  for ix in range(proc+1):
    tmp_y = []
    tmp_besty = []
    tmp_bestcfg = []
    readVTR(dir,tmp_y,tmp_besty,tmp_bestcfg,design,ix,limit)
    if len(tmp_y) == 0:
      continue
    if len(tmp_y) > length:
      length = len(tmp_y)
    y.append(tmp_y)
    best_y.append(tmp_besty)
    cfg.append(tmp_bestcfg)

  avg_y = []
  globalbest_y = []
  best_acu_y = []
  best_acu = -10000
  avg_acu_y = []
  avg_acu = -10000
  for ix in range(length):
    tmp_avg = 0
    tmp_best = -10000
    num = 0
    for iy in range(len(y)):
      if ix < len(y[iy]):
        num+=1
        if tmp_best < y[iy][ix]:
          tmp_best = y[iy][ix]
        if y[iy][ix] != -10000:
          tmp_avg += y[iy][ix]  #little bug
    tmp_avg = tmp_avg/num
    avg_y.append(tmp_avg)
    
    if tmp_best > target:
      if index == 0:
        print "\n"
        print "index" + design
        print mylabel
        print ix
        print "\n"
        index = 1
    
    if type != "raw":
      if tmp_best > upval:
        tmp_best = upval
    
    
    if best_acu < tmp_best:
      best_acu = tmp_best
    if avg_acu < tmp_avg:
      avg_acu = tmp_avg
    best_acu_y.append(best_acu)
    avg_acu_y.append(avg_acu)
    globalbest_y.append(tmp_best)

  if exp != 'my':
    while len(best_acu_y) < 800: 
      best_acu_y.append(best_acu_y[len(best_acu_y)-1])
  print design
  print mylabel
  print best_acu_y[len(best_acu_y)-1]
  ax.plot(best_acu_y,label=mylabel+'(best)',marker=mymarker,color=mycolor,linestyle='-',linewidth=width, markevery=20,markersize=3)
  ax.plot(avg_acu_y,label=mylabel+'(avg)',marker=mymarker,color=mycolor,linestyle=':',markevery=20,markersize=3)

  #plt.plot(globalbest_y,label=prelabel+'best_y',c='black', linestyle=style)
  #plt.plot(best_acu_y,label=prelabel+'best_acu_y',c='blue',linestyle=style)
  #plt.plot(avg_acu_y,label=prelabel+'avg_y',c='red',linestyle=style)
  #legend(loc="lower center",fontsize=8)
  #plt.savefig('design_line_vtr.pdf')



#if __name__ == '__main__':
#  design='or1200'
#  proc=8
#  dir='/proj/xsjhdstaff3/changx/project/parTuner/experiment/vpr/vtr_release/vtr_flow/tasks/openTunerTiming/experiment/my_9_14/'
#  style='-'
#  prelabel='my-old'
#  plot_acu_line(design,dir,proc,style,prelabel)
#
#  design='or1200'
#  dir='/proj/xsjhdstaff3/changx/project/parTuner/experiment/vpr/vtr_release/vtr_flow/tasks/openTunerTiming/experiment/my/'
#  style='-.'
#  prelabel='my'
#  plot_acu_line(design,dir,proc,style,prelabel)
#




