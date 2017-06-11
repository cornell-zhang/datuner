import sys
sys.path.append("SCRIPTPATH_HOLDER")
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

class ProgramTuner(Wrapper):
  design='BENCH_HOLDER'
  workspace='WORKSPACE_HOLDER'
  scriptpath='SCRIPTPATH_HOLDER'

  def __init__(self, *pargs, **kwargs):
    super(ProgramTuner, self).__init__(program_name="hello", *pargs, **kwargs)

  def manipulator(self):
    """
    call super manipulator
    Define the search space by creating a
    ConfigurationManipulator
    """
    filename=self.workspace+"/space"+str(self.args.myrank)+".txt"
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

    # call run method
    # generate result res

    end = time.time()

    #dump result
    super(ProgramTuner,self).dumpresult(self.args.myrank,cfg,res)
    return Result(time=-float(res[0]))


  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal b01 options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data,
                                        'inline_config.json')


if __name__ == '__main__':
  argparsers = opentuner.argparsers()
  argparsers.append(argparser)
  totalparser = argparse.ArgumentParser(parents=argparsers)
  args = totalparser.parse_args()

  mycmd='rm -f ./localresult'+str(args.myrank)+'.txt'
  subprocess.call(mycmd,shell=True)

  ProgramTuner.main(args)



