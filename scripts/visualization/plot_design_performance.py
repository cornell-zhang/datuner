import matplotlib.pyplot as plt
from pylab import *
import numpy as np
import sys
import math
import plotline
from plotline import *

if __name__ == '__main__':
  if len(sys.argv) < 5:
    print "Usage: plot_designs.py <workspace> <design_list> <proc_num> <search_num>"
    sys.exit(1)

  #----------parameters----------#
  workspace = sys.argv[1]
  design_file = sys.argv[2]
  design = []
  proc = int(sys.argv[3])
  iters = int(sys.argv[4])

  file = open(design_file)
  while 1:
    line = file.readline()
    if not line:
      break
    line = line[:-1]
    design.append(line)

  xtickts=[]
  xtickts.append(0)
  xtickts.append(iters/2)
  xtickts.append(iters)
  plt.xticks(xtickts)

  #---------single plot--------#
  if len(design) == 1:
    dir = workspace+"/"+design[0]
    plot_acu_line(plt,dir,proc)
    plt.title(design[0])
    plt.xticks(xtickts)
    plt.legend(loc="lower center",fontsize=8)
    plt.xlabel("Iterations")
    plt.ylabel("QoR")
    plt.savefig(design[0]+".pdf")
  else:
  #---------multiple plots-----#
    if len(design) > 10:
      print "At most 10 designs can be drawn in one plot\n"
      sys.exit(1)
    x_num = 0
    y_num = 0
    width = 0
    height = 0
    if len(design) <= 5:
      x_num = len(design)
      y_num = 1
      width = 13
      height = 3
    else:
      x_num = int(math.ceil(float(len(design))/float(2)))
      y_num = 2
      width = 13
      height = 6
    fig, faxs = plt.subplots(y_num,x_num,figsize=(width,height),facecolor='w',edgecolor='k')
    fig.subplots_adjust(hspace =.5, wspace=.3)
    axs = faxs.ravel()
    for ix in range(len(design)):
      dir = workspace+"/"+design[ix]
      plot_acu_line(axs[ix],dir,proc)
      axs[ix].set_title(design[ix])
      axs[ix].set_xticks(xtickts)
      if ix == 0:
        axs[ix].legend(loc="lower center",fontsize=8)
        axs[ix].set_xlabel("Iterations")
        axs[ix].set_ylabel("QoR")
    plt.savefig('tune_performance.pdf')

