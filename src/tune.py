import sys
import argparse
import opentuner
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result
import socket
import pickle
from config import *
from space_partition import *
from setup import *

class ProgramTuner(ProgramTunerWrapper):
  # param is a list that specifies the search space
  param = pickle.load(open('space.p', 'rb'))

  '''
  total_search_count = 1
  subspaces = []
  subspaces.append([space, 0, 1])
  global_result = []
  param = select_space(total_search_count, subspaces, global_result)
  '''

  def manipulator(self):
    manipulator = ConfigurationManipulator()
    for item in self.param:
      param_type, param_name, param_range = item
      if param_type == 'EnumParameter':
        manipulator.add_parameter(EnumParameter(param_name, param_range))
    return manipulator

  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data, 'inline_config.json')

  def dumpresult(self, cfg, sweepparam, res, metadata = []):
    """
    Compile and run a given configuration then
    return performance
    """
    f = open('./localresult.txt', 'a')
    for key in cfg:
      f.write(str(key) + "," + str(cfg[key]) + ", ")
    f.write(str(res) + ", ")
    f.write('\n')
    f.close()

    pickle.dump([sweepparam, res, metadata], open('result.p', 'wb'))
    
    # try:
    #   conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    #   conn.connect(server_address)
    #   msg = []
    #   for key in cfg:
    #     msg.append([key, cfg[key]])
    #   conn.send(pickle.dumps(['respond', msg, sweepparam, metadata, res]))
    #   conn.close() 
    # except:
    #   print "connection error!\n"

if __name__ == '__main__':
  argparser = opentuner.default_argparser()
  ProgramTuner.main(argparser.parse_args())