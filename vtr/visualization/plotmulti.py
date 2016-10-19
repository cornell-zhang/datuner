import matplotlib.pyplot as plt
from pylab import *
import numpy as np
import sys
import plotsingle
from plotsingle import *

def target1(design):
  if design == 'blob_merge':
    return 101.57
  if design == 'boundtop':
    return 161.36
  if design == 'diffeq1':
    return 42.52
  if design == 'ch_intrinsics':
    return 265.7
  if design == 'mkPktMerge':
    return 229.64
  if design == 'mkSMAdapter4B':
    return 185.99
  if design == 'sha':
    return 76.98
  if design == 'raygentop':
    return 185.79
  if design == 'or1200':
    return 78.71
  if design == 'stereovision0':
    return 210.47

def target(design):
  if design == 'blob_merge':
    return 98.67
  if design == 'boundtop':
    return 156.75
  if design == 'diffeq1':
    return 41.31
  if design == 'ch_intrinsics':
    return 258.11
  if design == 'mkPktMerge':
    return 223.08
  if design == 'mkSMAdapter4B':
    return 180.68
  if design == 'sha':
    return 74.78
  if design == 'raygentop':
    return 180.48
  if design == 'or1200':
    return 76.46
  if design == 'stereovision0':
    return 204.45

if __name__ == '__main__':
  design = ['blob_merge','boundtop','diffeq1','ch_intrinsics','mkPktMerge','mkSMAdapter4B','sha','raygentop','or1200','stereovision0']

  fig, axs = plt.subplots(2,5,figsize=(13,6),facecolor='w',edgecolor='k')
  fig.subplots_adjust(hspace =.5, wspace=.3)
  axs = axs.ravel()



  proc=8
  xtickts=[0,50,100]
  plt.xticks(xtickts)

  for ix in range(len(design)):
    tar=target(design[ix])
    dir='/proj/xsjhdstaff3/changx/project/parTuner/experiment/vpr/vtr_release/vtr_flow/tasks/openTunerTiming/experiment/'
    path='./parglobal/'
    mylabel='Par-OpenTuner'
    mymarker='D'
    mycolor='red'
    plot_acu_line(axs[ix],design[ix],path,proc,mylabel,mymarker,mycolor,100)
    
    path='./my-best/'
    mylabel='DATuner'
    mymarker='x'
    mycolor='blue'
    plot_acu_line(axs[ix],design[ix],path,proc,mylabel,mymarker,mycolor,100,tar,'my',2)


#    #dir='/proj/xsjhdstaff3/changx/project/parTuner/experiment/vpr/vtr_release/vtr_flow/tasks/openTunerTiming/experiment/baseline/'
#    path=dir+'data/opentuner/baseline/'
#    mylabel='SingleOpenTuner'
#    mymarker='o'
#    mycolor='black'
#    mytype='raw'
#    myval=0
#    if design[ix] == 'boundtop':
#      mytype='change'
#      myval=178
#    if design[ix] == 'or1200':
#      mytype='change'
#      myval= 81
#    plot_acu_line(axs[ix],design[ix],path,proc,mylabel,mymarker,mycolor,800,tar,'opentuner',1,mytype,myval)

#    path=dir+'data/fix-8/fix/'
#    mylabel='ParOpenTuner-subspace'
#    mymarker='+'
#    mycolor='green'
#    plot_acu_line(axs[ix],design[ix],path,proc,mylabel,mymarker,mycolor,100)
#

    axs[ix].set_title(design[ix])
    axs[ix].set_xticks(xtickts)

    if ix == 0:
      axs[ix].legend(loc="lower center",fontsize=8) 
      axs[ix].set_xlabel("Iterations")
      axs[ix].set_ylabel("Best found frequency(MHz)")


  plt.savefig('overall-vpr.pdf')

