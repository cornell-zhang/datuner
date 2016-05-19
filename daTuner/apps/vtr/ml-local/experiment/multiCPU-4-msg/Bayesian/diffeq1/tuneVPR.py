#/usr/bin/env python
import adddeps
import logging
import re
import time
import sys
import os
import argparse
import thread

import opentuner
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result
from mpi4py import MPI
from sklearn.semi_supervised import label_propagation
from sklearn.metrics import classification_report, confusion_matrix
from sklearn.naive_bayes import GaussianNB
from sklearn import cross_validation
import random
from random import randint
import numpy as np

abc_flags = [
    'resyn','resyn2','resyn3'
    ]
vpr_pack_flags = [
    'alpha_clustering','beta_clustering',
    'allow_unrelated_clustering','connection_driven_clustering'
    ]
vpr_place_flags = [
    'alpha_t','seed','inner_num','timing_tradeoff',
    'inner_loop_recompute_divider','td_place_exp_first','td_place_exp_last'
    ]
vpr_route_flags = [
    'max_router_iterations','initial_pres_fac','pres_fac_mult','acc_fac',
    'bb_factor','base_cost_type','astar_fac','max_criticality',
    'criticality_exp'
    ]

def genOption(cfg,opts):
  run_abc_cmd = " "
  for flag in abc_flags:
    if cfg[flag] == 'on':
      run_abc_cmd += '{0}; '.format(flag)
  run_abc_cmd += ' '+run_abc_cmd

  run_vpr_cmd = " "
  for flag in vpr_pack_flags:
    run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])
  for flag in vpr_place_flags:
    run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])
  for flag in vpr_route_flags:
    run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])

  opts.append(run_abc_cmd)
  opts.append(run_vpr_cmd)

def getBound(name,result):
  min = 0.0
  max = 0.0
  default = 0
  #type = 0 # discrete
  #type = 1 # continuous
  if name == "alpha_clustering":
    default = 0.75 #[0,1]
    min = 0
    max = 1
  elif name == "beta_clustering":
    default = 0.9 #[0,1]
    min = 0
    max = 1
  elif name == "alpha_t":
    default = 0.8
    min = 0.5
    max = 0.9
  elif name == "timing_tradeoff":
    default = 0.5
    min = 0.3
    max = 0.7
  elif name == "initial_pres_fac":
    default = 0.5 #[0.5,1000]
    min = 0.3
    max = 100
  elif name == "pres_fac_mult":
    default = 1.3
    min = 1.2
    max = 2
  elif name == "acc_fac":
    default = 1
    min = 1
    max = 2
  elif name == "astar_fac":
    default = 1.2
    min = 1
    max = 2
  elif name == "max_criticality":
    default = 0.99
    min = 0.8
    max = 1
  elif name == "criticality_exp":
    default = 1
    min = 0.8
    max = 1
  else:
    min = -1
    max = -1
  result.append(min)
  result.append(max)

def getParameter(finalresult):
  """
  get range of value for parameters
  """

  for flag in vpr_pack_flags:
    result = []
    getBound(flag,result)
    if result[0] != -1:
      finalresult.append((flag,result[0],result[1]))

  for flag in vpr_place_flags:
    result = []
    getBound(flag,result)
    if result[0] != -1:
      finalresult.append((flag,result[0],result[1]))
  for flag in vpr_route_flags:
    result = []
    getBound(flag,result)
    if result[0] != -1:
      finalresult.append((flag,result[0],result[1]))

def read_data(rawX,rawY,baseline,filename):
  """
  read data from files to build a machine learning model
  replace by users parser to parse result
  """

  import os.path
  if os.path.isfile(filename):
    f = open(filename,'r')
    while(1):
      line = f.readline()
      if not line: break
      listx = []
      listy = []
      if line.find("abcConfig") != -1:
        bufs = line.split()
        resynnum = 0
        resyn2num = 0
        resyn3num = 0
        for ix in range(len(bufs)):
          if bufs[ix] == "resyn;":
            resynnum  = 1
          if bufs[ix] == "resyn2;":
            resyn2num = 1
          if bufs[ix] == "resyn3;":
            resyn3num = 1
        listx.append(resynnum)
        listx.append(resyn2num)
        listx.append(resyn3num)

        line = f.readline()
        bufs = line.split()
        ix = 2
        while(ix < len(bufs)):
          tmpstr = bufs[ix].replace("\"","")
          tmpstr = tmpstr.replace(",","")
          if tmpstr == "on":
            listx.append(1) #transfer string type value to integer for learning
          elif tmpstr == "off":
            listx.append(0)
          elif tmpstr == "demand_only":
            listx.append(0)
          elif tmpstr == "delay_normalized":
            listx.append(1)
          else:
            listx.append(float(tmpstr))
          ix += 2

        line = f.readline()
        bufs = line.split()
        if float(bufs[4]) != -1 and float(bufs[4]) != 0:
          rawX.append(listx)
          if float(bufs[4]) > baseline: #binary classification 1: better than default setting 0: worse than default setting
            rawY.append(1)
          else:
            rawY.append(0)
    f.close()


def get_neighbour(cfg,Xtest,step,size):
  """
  get the neighbourhood of configuration cfg
  save in Xtest
  step controls the maximum number of parameters that can be different from cfg
  size controls the size of neighbourhood
  """

  paramList = ["resyn","resyn2","resyn3","alpha_clustering","beta_clustering","allow_unrelated_clustering",
      "connection_driven_clustering","alpha_t","seed","inner_num","timing_tradeoff","inner_loop_recompute_divider",
      "td_place_exp_first","td_place_exp_last","max_router_iterations","initial_pres_fac","pres_fac_mult","acc_fac",
      "bb_factor","base_cost_type","astar_fac","max_criticality","criticality_exp"]
  for ix in range(size):
    tmp = []
    test = []
    for key,value in cfg.iteritems():
      tmp.append(key)
    for it in range(step):
      rand = randint(0,len(tmp)-1)
      test.append(tmp[rand])

    if ix == 0:
      test = [] #add cfg itself to neighbour
    cfgcopy = cfg.copy() #fake cfgcopy non-legal format
    for iy in test: #randomly set value for each parameter
      if iy == "resyn" or iy == "resyn2" or iy == "resyn3":
        loctmp = [0,1]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "allow_unrelated_clustering" or iy == "connection_driven_clustering" or iy == "base_cost_type":
        loctmp = [0,1]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "seed":
        loctmp = [1,2,3,4,5]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "inner_num":
        loctmp = [1,10,100]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "inner_loop_recompute_divider":
        loctmp = [0,1,5]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "td_place_exp_first":
        loctmp = [0,1,3]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "td_place_exp_last":
        loctmp = [5,8,10]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "max_router_iterations":
        loctmp = [20,50,80]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      elif iy == "bb_factor":
        loctmp = [1,3,5]
        cfgcopy[iy] = loctmp[random.randint(0,len(loctmp)-1)]
      else:
        tmpres = []
        getBound(iy,tmpres)
        if tmpres[0] == -1 or tmpres[1] == -1:
          assert False
        cfgcopy[iy] = float(tmpres[0]+random.random()*(tmpres[1]-tmpres[0]))
    tmpparam = []
    for ip in paramList:
      if cfgcopy[ip] == "off" or cfgcopy[ip] == "demand_only":
        tmpparam.append(0)
      elif cfgcopy[ip] == "on" or cfgcopy[ip] == "delay_normalized":
        tmpparam.append(1)
      else:
        tmpparam.append(cfgcopy[ip])
    Xtest.append(tmpparam)

def readdb(Xtrain,ytrain,baseline,ranksize,exptype,tech,design):
  """
  read samples from files
  """
  bdir = '/work/zhang/users/chang/project/daTuner/opentuner/example/ml-local/experiment/'+exptype+'/'+tech+'/'+design+'/'

  for ix in range(ranksize):
    filename = bdir+'result_'+str(ix)+'.txt'
    read_data(Xtrain,ytrain,baseline,filename)

  assert len(Xtrain) == len(ytrain)
  return len(Xtrain)

def learn(cfg, Xtrain, ytrain):
  """
  do classification with Bayesian
  """

  paramList = ["resyn","resyn2","resyn3","alpha_clustering","beta_clustering","allow_unrelated_clustering",
      "connection_driven_clustering","alpha_t","seed","inner_num","timing_tradeoff","inner_loop_recompute_divider",
      "td_place_exp_first","td_place_exp_last","max_router_iterations","initial_pres_fac","pres_fac_mult","acc_fac",
      "bb_factor","base_cost_type","astar_fac","max_criticality","criticality_exp"]

  assert len(Xtrain) == len(ytrain) and len(Xtrain) > 0


  Xtest = []
  step = 5
  size = 100
  get_neighbour(cfg,Xtest,step,size)
  assert len(Xtest) != 0

  xtrainset = np.array(Xtrain)
  ytrainset = np.array(ytrain)
  xtestset = np.array(Xtest)

  clf = GaussianNB()
  #predict accurcy
  tmpXtrain, tmpXtest, tmpytrain, tmpytest = cross_validation.train_test_split(xtrainset,ytrainset,test_size=0.4,random_state = 0)
  clf.fit(tmpXtrain,tmpytrain)
  predictRes = clf.predict(tmpXtest)
  cm = confusion_matrix(tmpytest,predictRes)
  print cm
  print classification_report(tmpytest,predictRes)

  print "learning model"
  print "training set: "+str(len(xtrainset))
  print "test set: "+str(len(xtestset))
  clf.fit(xtrainset,ytrainset)
  predicted_proba = clf.predict_proba(xtestset)
  tmpbuf = []
  for ix in range(len(predicted_proba)):
    tmpbuf.append((xtestset[ix],1-predicted_proba[ix][0]))
  tmpbuf.sort(key=lambda tup:tup[1], reverse=True)

  newcfg = cfg.copy()
  for ix in range(len(paramList)):
    if paramList[ix] == "resyn" or paramList[ix] == "resyn2" or paramList[ix] == "resyn3" or paramList[ix] =="allow_unrelated_clustering" or paramList[ix] == "connection_driven_clustering":
      if float(tmpbuf[0][0][ix]) == 0:
        newcfg[paramList[ix]] = "off"
      else:
        newcfg[paramList[ix]] = "on"
    elif paramList[ix] == "base_cost_type":
      if float(tmpbuf[0][0][ix]) == 0:
        newcfg[paramList[ix]] = "demand_only"
      else:
        newcfg[paramList[ix]] = "delay_normalized"
    else:
      newcfg[paramList[ix]] = tmpbuf[0][0][ix]
  return newcfg

def runVPR(run_abc_cmd, run_vpr_cmd,exptype, tech, design, rank, reqid, res, requestor):
  """
  run VPR
  """

  import subprocess
  start = time.time()

  ### replace with your own path-to-vtr and path-to-workspace

  bdir = '/work/zhang/users/chang/project/daTuner/apps/vtr_release/vtr_flow/'
  sdir = bdir+'scripts/'

  workdir = '/work/zhang/users/chang/project/daTuner/opentuner/example/ml-local/experiment/'+exptype+'/'+tech+'/'+design+'/'

  #run_abc_cmd = ""
  cmd = 'sed -e \'s:ABC_OTHER_OPTIONS:'+run_abc_cmd+':g\' -e \'s:VPR_OTHER_OPTIONS:'+run_vpr_cmd+':g\' '+sdir+'tune_vtr_flow.pl > '+sdir+design+tech+'_tune_vtr_flow_'+exptype+str(rank)+'.pl'
  subprocess.Popen(cmd,shell=True).wait()
  cmd = 'chmod u+x '+sdir+design+tech+'_tune_vtr_flow_'+exptype+str(rank)+'.pl'
  subprocess.Popen(cmd,shell=True).wait()

  cmd = 'mkdir '+workdir+str(rank)
  subprocess.Popen(cmd,shell=True).wait()
  cmd = 'mkdir '+workdir+str(rank)+'/'+str(reqid)+'/'
  subprocess.Popen(cmd,shell=True).wait()

  arch = bdir+'/arch/timing/k6_frac_N10_mem32K_40nm.xml'
  bench = bdir+'/benchmarks/verilog/'+design+'.v'
  cmd = sdir+design+tech+'_tune_vtr_flow_'+exptype+str(rank)+'.pl '+bench+' '+arch+' -temp_dir '+workdir+str(rank)+'/'+str(reqid)
#+' -lut_size 6'
  subprocess.Popen(cmd,shell=True).wait()

  cmd = sdir+'parse_vtr_flow.pl '+workdir+str(rank)+'/'+str(reqid)+' '+bdir+'/parse/parse_config/vpr_my.txt |&tee '+workdir+str(rank)+'/'+str(reqid)+'/parseResult.txt'
  subprocess.Popen(cmd,shell=True).wait()

  min_chan_width = 0
  chipSize = 0
  logicarea = 0
  routearea = 0
  fmax = 0
  rt = 0
  placementwl = 0
  nets = 0
  blocks = 0
  clb = 0
  io = 0
  bram = 0
  mult = 0
  f = open(workdir+str(rank)+'/'+str(reqid)+'/parseResult.txt','r')
  while 1:
    line = f.readline()
    if not line: break
    if line.find("vpr_status") == -1:
      bufs = line.split()
      min_chan_width = bufs[1]
      chipSize = bufs[2]
      logicarea = bufs[3]
      routearea = bufs[4]
      fmax = bufs[6]
      rt = float(bufs[7])+float(bufs[8])+float(bufs[9])
      #placementwl = bufs[10]
      nets = bufs[10]
      blocks = bufs[11]
      clb = bufs[12]
      io = float(bufs[13])+float(bufs[14])
      bram = float(bufs[15])
      mult = float(bufs[16])
      #erro = float(bufs[17])
  f.close()
  res.append(fmax)
  res.append(rt)
  res.append(blocks)

  cmd = 'rm -r '+workdir+str(rank)+'/'+str(reqid)
  subprocess.Popen(cmd,shell=True).wait()
  cmd = 'rm '+sdir+design+tech+'_tune_vtr_flow_'+exptype+str(rank)+'.pl'
  subprocess.Popen(cmd,shell=True).wait()
  end = time.time()
  f = open('result_'+str(rank)+'.txt','a')
  f.write('abcConfig: '+run_abc_cmd+'\n')
  f.write('vprConfig: '+run_vpr_cmd+'\n')
  f.write(str(min_chan_width)+' '+str(chipSize)+' '+str(logicarea)+' '+str(routearea)+' '
      +str(fmax)+' '+str(rt)+' '+str(nets)+' '
      +str(blocks)+' '+str(clb)+' '+str(io)+' '+str(bram)+' '+str(mult)+' '
      +str(end-start)+' '+str(requestor)+'\n')
  f.close()

def check_same(cfg,cfg1):
  for key,value in cfg.iteritems():
    if value != cfg1[key]:
      return False
  return True

class VPRTuner(MeasurementInterface):
  def __init__(self, *pargs, **kwargs):
    super(VPRTuner, self).__init__(program_name="hello", *pargs, **kwargs)
    self.parallel_compile = False
    self.learnflag = True
#LEARNFLAG_HOLDER ##TODO-modify
    self.baseline = -1
    self.defaultcfg = {'resyn':'off','resyn2':'off','resyn3':'off',
        'alpha_clustering':0.75,'beta_clustering':0.9,
        'allow_unrelated_clustering':'on','connection_driven_clustering':'on',
        'alpha_t':0.8,'seed':1,'inner_num':10,'timing_tradeoff':0.5,
        'inner_loop_recompute_divider':0,'td_place_exp_first':1,'td_place_exp_last':8,
        'max_router_iterations':50,'initial_pres_fac':0.5,'pres_fac_mult':1.3,'acc_fac':1,
        'bb_factor':3,'base_cost_type':'delay_normalized','astar_fac':1.2,
        'max_criticality':0.99,'criticality_exp':1}


  def manipulator(self):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()
    for flag in abc_flags:
      manipulator.add_parameter(
        EnumParameter(flag,['on','off'])
        )
    manipulator.add_parameter(
        EnumParameter('allow_unrelated_clustering',['on','off'])
        )
    manipulator.add_parameter(
        EnumParameter('connection_driven_clustering',['on','off'])
        )
    manipulator.add_parameter(
        EnumParameter('base_cost_type',['demand_only','delay_normalized'])
        )
    manipulator.add_parameter(
        EnumParameter('seed',[1,2,3,4,5])
        )
    manipulator.add_parameter(
        EnumParameter('inner_num',[1,10,100])
        )
    manipulator.add_parameter(
        EnumParameter('inner_loop_recompute_divider',[0,1,5])
        )
    manipulator.add_parameter(
        EnumParameter('td_place_exp_first',[0,1,3])
        )
    manipulator.add_parameter(
        EnumParameter('td_place_exp_last',[5,8,10])
        )
    manipulator.add_parameter(
        EnumParameter('max_router_iterations',[20,50,80])
        )
    manipulator.add_parameter(
        EnumParameter('bb_factor',[1,3,5])
        )

    finalresult = []
    getParameter(finalresult)
    for flag,min,max in finalresult:
      manipulator.add_parameter(
          FloatParameter(flag,min,max)
          )
    return manipulator


  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    result_id = desired_result.id
    rank = 0
    ranksize = 0
    if self.msgPassing is not None:
      rank = self.msgPassing.comm.Get_rank()
      ranksize = self.msgPassing.comm.Get_size()
    design = "diffeq1"
    exptype = "multiCPU-4-msg"
    tech = "Bayesian"

    run_abc_cmd = " "
    for flag in abc_flags:
      if cfg[flag] == 'on':
        run_abc_cmd += '{0}; '.format(flag)
    run_abc_cmd += ' '+run_abc_cmd

    run_vpr_cmd = " "
    for flag in vpr_pack_flags:
      run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])
    for flag in vpr_place_flags:
      run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])
    for flag in vpr_route_flags:
      run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])

    newcfg = None
    if self.learnflag:
      if self.baseline == -1:
        opts = []
        genOption(self.defaultcfg,opts)
        tmpres = []
        requestor = "checkDefault"
        runVPR(opts[0],opts[1], exptype, tech,design, rank, result_id, tmpres, requestor)
        self.baseline = float(tmpres[0])
      Xtrain = []
      ytrain = []
      if readdb(Xtrain,ytrain,self.baseline,ranksize,exptype,tech,design) > 100:
        print "use learning"
        newcfg = learn(cfg,Xtrain,ytrain)
        opts = []
        genOption(newcfg,opts)
        run_abc_cmd = opts[0]
        run_vpr_cmd = opts[1]

    res = []
    requestor = desired_result.requestor
    if newcfg is not None:
      requestor = "learn"
    runVPR(run_abc_cmd,run_vpr_cmd, exptype, tech,design, rank, result_id, res, requestor)
    wns = float(res[0])
    if newcfg is not None:
      for key,value in newcfg.iteritems():
        cfg[key] = newcfg[key]
    print "result"
    print wns
    print "final cfg"
    print cfg
    return Result(time=-wns)


  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal b01 options written to bench_config.json:", configuration.data
    #self.manipulator().save_to_file(configuration.data,
    #                                    'inline_config.json')


#if __name__ == '__main__':
#  argparser = opentuner.default_argparser()
#  args = argparser.parse_args()
#  VPRTuner.main(args)
