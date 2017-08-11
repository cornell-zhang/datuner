#------------------------------------------
# DATuner custom flow for Design Compiler
#------------------------------------------

import sys
import logging
import re
import time
import os
import os.path
import argparse
import thread
import adddeps
import opentuner
import subprocess
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result
from programWrapper import *

sys.path.append("SCRIPTPATH_HOLDER")
argparser = argparse.ArgumentParser(add_help=False)
argparser.add_argument('--myrank', type = int, default = 0, help = 'the rank of process')

#--------------------------------------------
# definition of search space
#--------------------------------------------

dc_flags = [
    'gate_clock',
    'retime',
    'timing_high_effort_script',
    'area_high_effort_script', 
    'no_boundary_optimization'
    ]

class ProgramTuner(Wrapper):
  design = 'BENCH_HOLDER'
  workspace = 'WORKSPACE_HOLDER'
  scriptpath = 'SCRIPTPATH_HOLDER'

  def __init__(self, *pargs, **kwargs):
    super(ProgramTuner, self).__init__(program_name = "tune_dc", *pargs, **kwargs)

  def manipulator(self):
    """
    call super manipulator
    Define the search space by creating a
    ConfigurationManipulator
    """
    filename = self.workspace + "/space" + str(self.args.myrank) + ".txt"
    manipulator = super(ProgramTuner,self).manipulator(filename)

    return manipulator


  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    start = time.time()
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    # generate configuration
    dc_config = ""
    run_dc_cmd = ""
    for flag in dc_flags:
      dc_config += flag + ' '+str(cfg[flag])+' '
      if cfg[flag] == 'on':
        run_dc_cmd += '-{0} '.format(flag)

    # run design compiler
    res = []
    requestor = desired_result.requestor
    self.rundc(run_dc_cmd, dc_config, result_id, res, requestor)
    end = time.time()

    super(ProgramTuner,self).dumpresult(self.args.myrank, cfg, res)
    return Result(time = float(res[0]))


  def rundc(self, run_dc_cmd, dc_config, reqid, res, requestor):
    start = time.time()
    sdir = self.scriptpath + '/'
    workdir = self.workspace + '/'

    cmd = 'mkdir -p ' + workdir + str(self.args.myrank)
    cmd += '; mkdir -p ' + workdir + str(self.args.myrank) + '/' + str(reqid) + '/'
    os.system(cmd)

    cmd = 'cp -r ' + sdir + 'eda_flows/custom/* ' + workdir + str(self.args.myrank) \
          + '/' + str(reqid) + '/'
    os.system(cmd)
    cmd = 'sed -e \'s:DC_OPTIONS:' + run_dc_cmd + ':g\' ' + self.scriptpath \
          + '/eda_flows/custom/flow/dc-syn/rm_dc_scripts/dc.tcl > ' + workdir \
          + str(self.args.myrank) + '/' + str(reqid) \
          + '/flow/dc-syn/rm_dc_scripts/dc.tcl'
    os.system(cmd)

    pwd = os.getcwd()
    os.chdir(workdir + str(self.args.myrank) + '/' + str(reqid) + '/flow/dc-syn')
    cmd = 'make'
    subprocess.Popen(cmd, shell = True).wait()
    os.chdir(pwd)

    wns = 0.0
    area = 0.0
    file = workdir + str(self.args.myrank) + '/' + str(reqid) + \
            '/flow/dc-syn/current-dc/reports/' + self.design + '.mapped.qor.rpt'

    f = open(file)
    while True:
      line = f.readline()
      if not line: break
      if "Design Area" in line:
        area = float(line.split()[2])
      if "WNS" in line:
        wns = float(line.split()[2])
        break
    f.close()
    res.append(wns)
    res.append(area)

    cmd = 'rm -r ' + workdir + str(self.args.myrank) + '/' + str(reqid)
    os.system(cmd)

    end = time.time()
    f = open('./result_' + str(self.args.myrank) + '.txt','a')
    f.write('dcConfig: ' + run_dc_cmd + '\n')
    f.write(str(wns) + ',' + str(area) + '\n')
    f.close()


  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal b01 options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data, 'inline_config.json')


if __name__ == '__main__':
  argparsers = opentuner.argparsers()
  argparsers.append(argparser)
  totalparser = argparse.ArgumentParser(parents = argparsers)
  args = totalparser.parse_args()

  mycmd='rm -f ./localresult' + str(args.myrank) + '.txt'
  subprocess.call(mycmd, shell = True)
  ProgramTuner.main(args)
