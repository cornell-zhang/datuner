import logging
import re
import time
import sys
import os
import argparse
import thread
import adddeps
import opentuner
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result

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

def getBound(catgory,name,result):
  min = 0
  max = 0
  default = 0
  #type = 0 # discrete
  #type = 1 # continuous
  if catgory == "vpr_pack_flags":
    if name == "alpha_clustering":
      default = 0.75 #[0,1]
      min = 0
      max = 1
    elif name == "beta_clustering":
      default = 0.9 #[0,1]
      min = 0
      max = 1
    else:
      min = -1
      max = -1
  if catgory == "vpr_place_flags":
    if name == "alpha_t":
      default = 0.8
      min = 0.5
      max = 0.9
    elif name == "timing_tradeoff":
      default = 0.5
      min = 0.3
      max = 0.7
    else:
      min = -1
      max = -1
  if catgory == "vpr_route_flags":
    if name == "initial_pres_fac":
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
  for flag in vpr_pack_flags:
    result = []
    getBound("vpr_pack_flags",flag,result)
    if result[0] != -1:
      finalresult.append((flag,result[0],result[1]))

  for flag in vpr_place_flags:
    result = []
    getBound("vpr_place_flags",flag,result)
    if result[0] != -1:
      finalresult.append((flag,result[0],result[1]))
  for flag in vpr_route_flags:
    result = []
    getBound("vpr_route_flags",flag,result)
    if result[0] != -1:
      finalresult.append((flag,result[0],result[1]))

def runVPR(run_abc_cmd, run_vpr_cmd, abc_config, vpr_config, design, rank, reqid, res, requestor):
  import subprocess
  start = time.time()
  exptype='EXPTYPE'
  spacepath='PATH_HOLDER'
  vprpath='VPR_PATH'
  #path to vtr scripts
  bdir=vprpath
  sdir = bdir+'scripts/'

  workdir = spacepath+'/'
 # workdir = bdir+'tasks/openTunerTiming/experiment/'+exptype+'/'+design+'/'



  #run_abc_cmd = ""
  cmd = 'sed -e \'s:ABC_OTHER_OPTIONS:'+run_abc_cmd+':g\' -e \'s:VPR_OTHER_OPTIONS:'+run_vpr_cmd+':g\' '+sdir+'tune_vtr_flow.pl > '+sdir+design+'_tune_vtr_flow_'+exptype+str(rank)+'.pl'
  subprocess.Popen(cmd,shell=True).wait()
  cmd = 'chmod u+x '+sdir+design+'_tune_vtr_flow_'+exptype+str(rank)+'.pl'
  subprocess.Popen(cmd,shell=True).wait()

  cmd = 'mkdir '+workdir+str(rank)
  subprocess.Popen(cmd,shell=True).wait()
  cmd = 'mkdir '+workdir+str(rank)+'/'+str(reqid)+'/'
  subprocess.Popen(cmd,shell=True).wait()

  arch = bdir+'/arch/timing/k6_frac_N10_mem32K_40nm.xml'
  bench = bdir+'/benchmarks/verilog/'+design+'.v'
  cmd = sdir+design+'_tune_vtr_flow_'+exptype+str(rank)+'.pl '+bench+' '+arch+' -temp_dir '+workdir+str(rank)+'/'+str(reqid)
#+' -lut_size 6'
  subprocess.Popen(cmd,shell=True).wait()

  cmd = sdir+'parse_vtr_flow.pl '+workdir+str(rank)+'/'+str(reqid)+' '+bdir+'/parse/parse_config/vpr_my.txt > '+workdir+str(rank)+'/'+str(reqid)+'/parseResult.txt'
  subprocess.Popen(cmd,shell=True).wait()

  min_chan_width = 0
  chipSize = 0
  logicarea = 0
  routearea = 0
  fmax = -10000
  rt = 0
  placementwl = 0
  nets = 0
  blocks = 0
  clb = 0
  io = 0
  bram = 0
  mult = 0
  import os.path
  file=workdir+str(rank)+'/'+str(reqid)+'/parseResult.txt'
  if os.path.isfile(file):
    f= open(file)
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
  cmd = 'rm '+sdir+design+'_tune_vtr_flow_'+exptype+str(rank)+'.pl'
  subprocess.Popen(cmd,shell=True).wait()

  end = time.time()
  f = open('./result_'+str(rank)+'.txt','a')
  f.write('abcConfig: '+run_abc_cmd+'\n')
  f.write('vprConfig: '+run_vpr_cmd+'\n')
  f.write(str(min_chan_width)+' '+str(chipSize)+' '+str(logicarea)+' '+str(routearea)+' '
      +str(fmax)+' '+str(rt)+' '+str(nets)+' '
      +str(blocks)+' '+str(clb)+' '+str(io)+' '+str(bram)+' '+str(mult)+' '
      +str(end-start)+' '+str(requestor)+'\n')
  f.close()

  f = open('./localresult'+str(rank)+'.txt','a')
  f.write(abc_config+' ')
  f.write(vpr_config+' ')
  f.write(str(fmax)+'\n')
  f.close()


class VPRTuner(MeasurementInterface):
  def __init__(self, *pargs, **kwargs):
    super(VPRTuner, self).__init__(program_name="hello", *pargs, **kwargs)
    self.parallel_compile = False

  def manipulator(self):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()

    import os.path
    bench='BENCH_HOLDER'
    exptype='EXPTYPE'
    spacepath='PATH_HOLDER'

    filename=spacepath+"/space"+str(self.args.rank)+".txt"
    if os.path.isfile(filename):
      f = open(filename,'r')
      while(1):
        line = f.readline()
        if not line: break
        buf = []
        buf = line.split()
        name = buf[0]
        paramType = buf[1]
        default = buf[2]
        minval = buf[3]
        maxval = buf[4]
        print " debug name min max "+name+" "+minval+" "+maxval
        optnum = buf[5]
        if paramType == "EnumParameter":
          opt = []
          for it in range(int(optnum)):
            opt.append(buf[6+it])
          manipulator.add_parameter(EnumParameter(name,opt))
        if paramType == "FloatParameter":
          manipulator.add_parameter(FloatParameter(name,float(minval),float(maxval)))
    return manipulator



  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    start = time.time()
    cfg = desired_result.configuration.data
    result_id = desired_result.id
    print "debug result id"
    print result_id


    design = "BENCH_HOLDER"

    abc_config = " "
    run_abc_cmd = " "
    for flag in abc_flags:
      abc_config += flag + ' '+str(cfg[flag])+' '
      if cfg[flag] == 'on':
        run_abc_cmd += '{0}; '.format(flag)
    run_abc_cmd += ' '+run_abc_cmd

    vpr_config = " "
    run_vpr_cmd = " "
    for flag in vpr_pack_flags:
      run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])
      vpr_config += flag +' '+str(cfg[flag])+' '
    for flag in vpr_place_flags:
      run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])
      vpr_config += flag +' '+str(cfg[flag])+' '
    for flag in vpr_route_flags:
      run_vpr_cmd += '    \"--'+flag+'\",       \"{0}\",'.format(cfg[flag])
      vpr_config += flag +' '+str(cfg[flag])+' '


    res = []
    requestor = desired_result.requestor
    runVPR(run_abc_cmd,run_vpr_cmd, abc_config, vpr_config, design, self.args.rank, result_id, res, requestor)

#    min_chan_width = 0
#    chipSize = 0
#    logicarea = 0
#    routearea = 0
#    fmax = -100
#    rt = 0
#    placementwl = 0
#    nets = 0
#    blocks = 0
#    clb = 0
#    io = 0
#    bram = 0
#    mult = 0

    end = time.time()
#    f = open('./result'+str(self.args.rank)+'.txt','a')
#    f.write('abcConfig: '+abc_config+'\n')
#    f.write('vprConfig: '+vpr_config+'\n')
#    f.write(str(min_chan_width)+' '+str(chipSize)+' '+str(logicarea)+' '+str(routearea)+' '
#      +str(fmax)+' '+str(rt)+' '+str(nets)+' '
#      +str(blocks)+' '+str(clb)+' '+str(io)+' '+str(bram)+' '+str(mult)+' '
#      +str(end-start)+' '+str(requestor)+'\n')
#    f.close()
#
#

    return Result(time=-float(res[0]))


  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal b01 options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data,
                                        'inline_config.json')


if __name__ == '__main__':
  argparser = opentuner.default_argparser()
  args = argparser.parse_args()

  print "debugVPR"+str(args.rank)
  mycmd='rm ./localresult'+str(args.rank)+'.txt'
  import subprocess
  subprocess.call(mycmd,shell=True)
  VPRTuner.main(args)
  #mycmd='rm ./StartPointSpace'+str(args.rank)
  #subprocess.call(mycmd,shell=True)



