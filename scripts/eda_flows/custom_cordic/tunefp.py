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
#
# the following key format is not compatible with sqlite3  
#
FP_Parameters = [
  'fixtypex_0',  'fixtypex_1', 'fixtypez_0',
  'fixtypey_0',  'fixtypey_1', 'fixtypez_1'
]

#FP_Flags = [
#    'fixtypex_2', 'fixtypey_2', 'fixtypez_2'
#]

class ProgramTuner(Wrapper):
  workspace='WORKSPACE_HOLDER'
  counter = 1
  def __init__(self, *pargs, **kwargs):
    super(ProgramTuner, self).__init__(program_name="hello", *pargs, **kwargs)
#   self.vtrpath = '/home/xuchang/nas/project/daTuner/myrelease/build/pkgs/vtr/vtr_release/vtr_flow/'
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
    for flag in FP_Parameters:
      type_config += flag + ' '+str(cfg[flag])+' '
#    for index in FP_Flags:
#      model_config += index + ' ' + str(cfg[index])+' '


    #run cordic and return return the score
    accu_total = 0
    total = 0
    angles = [5,15,25,35,45,50,55,65,75,85]    
    param_name_list = []
    param_list = []
    for sl in ['x', 'y', 'z']:
      for tl in [0, 1]:
        param_name_list.append(("fixtype" + sl + "_" + str(tl)))
#    print param_name_list
#    print " "

    for var in range(0, len(param_name_list)):
      temp = cfg[param_name_list[var]]
#      if ((1 + var) % 3 == 0):
#        pass
#      else:
      total += int(cfg[param_name_list[var]])
      param_list.append(temp)
#    print param_list

# calculate mean accuracy
    for ang in range(10):
      fp_run = "python ./Cordic_fixed.py "
      fp_run += str(angles[ang])

      for index in range(len(param_list)):
        fp_run += " "
        fp_run += str(param_list[index])

      print "This is fp_run " + fp_run
      run_result = self.call_program(fp_run)
      assert run_result['returncode'] == 0
      lines = run_result['stdout'].split()
 #     print "This is lines ", lines
      err = lines[len(lines) - 1]
      print "err: " + err
      print "total: ", total
      accuracy = (angles[ang] - float(err)) / angles[ang]
      print "incycle: ", ang, "accuracy: ", accuracy
      accu_total += accuracy * (1 / 10.0)
      print "accu_total: ", accu_total

    result = 0
    if accu_total > 0.95:
      result = total
    else:
      result = total + (100000 * (1 - (float(accu_total))))

    print err, accu_total, result
    print  "time is ", run_result['time']
    print " "
    
#    mycmd='rm -f ./localresult'+str(args.myrank)+'.txt'    # delete previous config
#    subprocess.call(mycmd,shell=True)
#    self.save_cordic(fp_run, type_config, model_config, result)
    super(ProgramTuner,self).dumpresult(self.args.myrank,cfg,result)
     
#    cmd = 'rm -rf '+self.workspace+'/space'+str(self.args.myrank)+'.txt'
#    subprocess.Popen(cmd,shell=True).wait()
    
    return Result(time= result)

#  def save_cordic(self,run_cmd, type_config, model_config, result) :
#    f = open('./localresult'+str(self.args.myrank)+'.txt','a')    # dump the result
#    f.write(type_config+' ')
#    f.write(model_config+' ')
#    f.write(str(float(result))+'\n')
#    f.close()

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



