import logging
import re
import time
import os
import os.path
import argparse
import thread
import opentuner
import subprocess
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result
import sys
sys.path.append("/home/xuchang/nas/project/daTuner/release/scripts/")
import adddeps
from programWrapper import *

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

class VPRTuner(Wrapper):
  design='BENCH_HOLDER'
  exptype='EXPTYPE'
  spacepath='PATH_HOLDER'

  def __init__(self, *pargs, **kwargs):
    super(VPRTuner, self).__init__(*pargs, **kwargs)

  def manipulator(self):
    """
    call super manipulator
    Define the search space by creating a
    ConfigurationManipulator
    """
    filename=self.spacepath+"/space"+str(self.args.rank)+".txt"
    manipulator = super(VPRTuner,self).manipulator(filename)

    return manipulator



  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    start = time.time()
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    #generate configuration
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

    #runVPR
    res = []
    requestor = desired_result.requestor
    self.runVPR(run_abc_cmd,run_vpr_cmd, abc_config, vpr_config, result_id, res, requestor)
    super(VPRTuner,self).dumpresult(self.args.rank,cfg,res)
    end = time.time()
    return Result(time=-float(res[0]))

  def runVPR(self,run_abc_cmd, run_vpr_cmd, abc_config, vpr_config, reqid, res, requestor):
    start = time.time()
    #path to vtr scripts
    bdir='/home/xuchang/nas/project/daTuner/experiment/vtr_release/vtr_flow/'
    sdir = bdir+'scripts/'
    workdir = self.spacepath+'/'

    #run_abc_cmd = ""
    cmd = 'sed -e \'s:ABC_OTHER_OPTIONS:'+run_abc_cmd+':g\' -e \'s:VPR_OTHER_OPTIONS:'+run_vpr_cmd+':g\' '+sdir+'tune_vtr_flow.pl > '+sdir+self.design+'_tune_vtr_flow_'+self.exptype+str(self.args.rank)+'.pl'
    subprocess.Popen(cmd,shell=True).wait()
    cmd = 'chmod u+x '+sdir+self.design+'_tune_vtr_flow_'+self.exptype+str(self.args.rank)+'.pl'
    subprocess.Popen(cmd,shell=True).wait()
    cmd = 'mkdir '+workdir+str(self.args.rank)
    subprocess.Popen(cmd,shell=True).wait()
    cmd = 'mkdir '+workdir+str(self.args.rank)+'/'+str(reqid)+'/'
    subprocess.Popen(cmd,shell=True).wait()

    arch = bdir+'/arch/timing/k6_frac_N10_mem32K_40nm.xml'
    bench = bdir+'/benchmarks/verilog/'+self.design+'.v'
    cmd = sdir+self.design+'_tune_vtr_flow_'+self.exptype+str(self.args.rank)+'.pl '+bench+' '+arch+' -temp_dir '+workdir+str(self.args.rank)+'/'+str(reqid)
    subprocess.Popen(cmd,shell=True).wait()
    cmd = sdir+'parse_vtr_flow.pl '+workdir+str(self.args.rank)+'/'+str(reqid)+' '+bdir+'/parse/parse_config/vpr_my.txt > '+workdir+str(self.args.rank)+'/'+str(reqid)+'/parseResult.txt'
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
    file=workdir+str(self.args.rank)+'/'+str(reqid)+'/parseResult.txt'
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
          nets = bufs[10]
          blocks = bufs[11]
          clb = bufs[12]
          io = float(bufs[13])+float(bufs[14])
          bram = float(bufs[15])
          mult = float(bufs[16])
      f.close()
    res.append(fmax)
    res.append(rt)
    res.append(blocks)

    cmd = 'rm -r '+workdir+str(self.args.rank)+'/'+str(reqid)
    subprocess.Popen(cmd,shell=True).wait()
    cmd = 'rm '+sdir+self.design+'_tune_vtr_flow_'+self.exptype+str(self.args.rank)+'.pl'
    subprocess.Popen(cmd,shell=True).wait()

    end = time.time()
    f = open('./result_'+str(self.args.rank)+'.txt','a')
    f.write('abcConfig: '+run_abc_cmd+'\n')
    f.write('vprConfig: '+run_vpr_cmd+'\n')
    f.write(str(min_chan_width)+' '+str(chipSize)+' '+str(logicarea)+' '+str(routearea)+' '
      +str(fmax)+' '+str(rt)+' '+str(nets)+' '
      +str(blocks)+' '+str(clb)+' '+str(io)+' '+str(bram)+' '+str(mult)+' '
      +str(end-start)+' '+str(requestor)+'\n')
    f.close()

    #f = open('./localresult'+str(self.args.rank)+'.txt','a')
    #f.write(abc_config+' ')
    #f.write(vpr_config+' ')
    #f.write(str(fmax)+'\n')
    #f.close()

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



