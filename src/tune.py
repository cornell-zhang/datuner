import sys
import argparse
import opentuner
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import IntegerParameter
from opentuner import MeasurementInterface
from opentuner import Result
import socket
import pickle
import os
from setup import *

class ProgramTuner(ProgramTunerWrapper):
  
  if os.path.exists(os.getcwd() + '/vtr.py'):
    from vtr import designdir
    from vtr import archdir
    from vtr import vtrpath
    from vtr import target_cp
  elif os.path.exists(os.getcwd() + '/vivado.py'):
    from vivado import top_module
  elif os.path.exists(os.getcwd() + '/quartus.py'):
    from quartus import top_module
    from quartus import target_family
    from quartus import target_device
  elif os.path.exists(os.getcwd() + '/custom.py'):
    import custom
  
  param = pickle.load(open('space.p', 'rb'))
  if os.path.isfile('sweep.p'):
    sweep, genfile = pickle.load(open('sweep.p', 'rb'))

  def manipulator(self):
    manipulator = ConfigurationManipulator()
    for item in self.param:
      param_type, param_name, param_range = item
      if param_type == 'EnumParameter':
        manipulator.add_parameter(EnumParameter(param_name, param_range))
      elif param_type == 'IntegerParameter' :
        manipulator.add_parameter(IntegerParameter(param_name, param_range[0], param_range[1]))
      elif param_type == 'FloatParameter' :
        manipulator.add_parameter(FloatParameter(param_name, param_range[0], param_range[1]))
    return manipulator

  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data, 'inline_config.json')

  def dumpresult(self, cfg, res, metadata = []):
    """
    Compile and run a given configuration then
    return performance
    """
    f = open('./localresult.txt', 'a')
    for key in cfg:
      f.write(str(key) + "," + str(cfg[key]) + ",")
    f.write(str(res))
    f.write('\n')
    f.close()
    msg = []
    for key in cfg:
      msg.append([key, cfg[key]])
    pickle.dump([msg, metadata, res], open('result.p', 'wb'))

if __name__ == '__main__':
  argparser = opentuner.default_argparser()
  ProgramTuner.main(argparser.parse_args())
