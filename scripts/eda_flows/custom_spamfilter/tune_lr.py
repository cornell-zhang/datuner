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
import math
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result
from programWrapper import *

argparser = argparse.ArgumentParser(add_help=False)
argparser.add_argument('--myrank',type=int, default=0,
    help='the rank of process')

#--------------------------------------------
# Fixed-point Cordic parameter space
#--------------------------------------------
FP_Parameters = [
  'FEA_I',  'FEA_F', 'DATA_I',
  'DATA_F',  'DATA2_I', 'LABEL_I',
  'LABEL2_I'
]

class ProgramTuner(Wrapper):
  workspace='WORKSPACE_HOLDER'
  def __init__(self, *pargs, **kwargs):
    super(ProgramTuner, self).__init__(program_name="hello", *pargs, **kwargs)
  def manipulator(self):  
    filename=self.workspace+"/space"+str(self.args.myrank)+".txt"
    manipulator = super(ProgramTuner,self).manipulator(filename)
    return manipulator


  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    result_id = desired_result.id
    
    compile_cmd = 'g++ '
    compile_cmd += '-DMYRANK='+str(self.args.myrank)+' '
    for item in FP_Parameters:
      compile_cmd += '-D'+item+'='+cfg[item]+' '
    compile_cmd +=  '-I/scratch/xilinx/Vivado_HLS/2017.2/include/ -O3 LogisticRegression.cpp -o logistic'
    print compile_cmd
    run_result = self.call_program(compile_cmd)
    assert run_result['returncode'] == 0
    
    run_cmd ='./logistic' 
    run_result = self.call_program(run_cmd)
    assert run_result['returncode'] == 0
      
    filename = 'result' + str(self.args.myrank) + ".txt"
    f = open(filename, 'r')
    result = f.readlines()
    result = float(result[0])
    f.close()
    
    super(ProgramTuner,self).dumpresult(self.args.myrank,cfg,result)
    return Result(time= result)

  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data,
                                        'inline_config.json')

if __name__ == '__main__':
  argparsers = opentuner.argparsers()
  argparsers.append(argparser)
  totalparser = argparse.ArgumentParser(parents=argparsers)
  args = totalparser.parse_args()
  
  mycmd='rm -f ./localresult'+str(args.myrank)+'.txt'    # delete previous config
  subprocess.call(mycmd,shell=True)
  ProgramTuner.main(args)



