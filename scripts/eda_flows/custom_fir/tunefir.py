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

argparser = argparse.ArgumentParser(add_help=False)
argparser.add_argument('--myrank',type=int, default=0,
    help='the rank of process')

#--------------------------------------------
# Fixed-point Cordic parameter space
#--------------------------------------------

custom_flags = [
  'input_0', 'input_1', 'numtap_0',
  'bands_0', 'bands_1', 'desire_0',
  'desire_1']

class ProgramTuner(Wrapper):
  workspace='WORKSPACE_HOLDER'
  counter = 1
  def __init__(self, *pargs, **kwargs):
    super(ProgramTuner, self).__init__(program_name="hello", *pargs, **kwargs)
  def manipulator(self):  
    filename=self.workspace+"/space"+str(self.args.myrank)+".txt"
    if self.counter % 3 == 0:
      f1 = open(self.workspace+"/space"+str(self.args.myrank)+".txt", 'r')
      f2 = open(self.workspace+"/space"+str(self.args.myrank)+"_save.txt", 'a')
      for line in f1:
        f2.write(line)
      f2.write('\n')
      f1.close()
      f2.close()
    self.counter += 1
    manipulator = super(ProgramTuner,self).manipulator(filename)
    return manipulator

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    #generate configuration
    type_config = " "
#    model_config = " "
    for flag in custom_flags:
      type_config += flag + ' '+str(cfg[flag])+' '
#    for index in FP_Flags:
#      model_config += index + ' ' + str(cfg[index])+' '

    #run cordic and return return the score
    err_total = 0
    total = 0
    param_name_list = custom_flags
    param_list = []
    
    for var in range(0, len(param_name_list)):
      temp = cfg[param_name_list[var]]
      total += int(cfg[param_name_list[var]])
      param_list.append(temp)

# calculate mean accuracy
    for ang in range(10):
      py_path = "python "
      fp_run = py_path + "./fir.py " + str(self.args.myrank)

      for index in range(len(param_list)):
        fp_run += " "
        fp_run += str(param_list[index])

      run_result = self.call_program(fp_run)
      assert run_result['returncode'] == 0

      filename = 'mse' + str(self.args.myrank) + '.txt'
      f = open(filename,'r')
      text = f.readlines()
      err = float(text[0])

    result = 0
    if err_total < 20:
      result = total
    else:
      result = total + 10000

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



