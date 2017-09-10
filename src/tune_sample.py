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

server_address = ('128.253.128.53', 10000)

class ProgramTuner(MeasurementInterface):
  # Create a TCP/IP socket
  conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
 
  # Connect the socket to the port where the server is listening
  print >> sys.stderr, 'connecting to %s port %s' % server_address
  conn.connect(server_address)

  conn.send(pickle.dumps(['init']))

  param = []
  try:
    for i in range(int(conn.recv(32))):
      data = pickle.loads(conn.recv(8096))
      param.append(data)
  finally:
    conn.close()

  def manipulator(self):
    manipulator = ConfigurationManipulator()
    for item in self.param:
      param_type, param_name, param_range = item
      if param_type == 'EnumParameter':
        manipulator.add_parameter(EnumParameter(param_name, param_range))
    return manipulator

  def get_qor(self):
    f = open('qor.txt', 'r')   
    return float(f.readlines()[0])

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    # acquire configuration
    index = cfg['index']
    sample_run = "python ./sample.py " + str(index)
    run_result = self.call_program(sample_run)
    assert run_result['returncode'] == 0

    result = self.get_qor()
    self.dumpresult(cfg, result)
    return Result(time = result)

  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data, 'inline_config.json')

  def dumpresult(self, cfg, res):
    """
    Compile and run a given configuration then
    return performance
    """
    f = open('./localresult.txt', 'a')
    for key in cfg:
      f.write(str(key) + " " + str(cfg[key]) + " ")
    f.write(str(res))
    f.write('\n')
    f.close()
    try:
      conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      conn.connect(server_address)
      conn.send(pickle.dumps(['respond', cfg[key], res]))
      conn.close() 
    except:
      print "connection error!\n"

if __name__ == '__main__':
  argparser = opentuner.default_argparser()
  ProgramTuner.main(argparser.parse_args())
