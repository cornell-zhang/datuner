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
import socket

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect the socket to the port where the server is listening
server_address = ('128.84.48.152', 10000)
print >>sys.stderr, 'connecting to %s port %s' % server_address
sock.connect(server_address)

class ProgramTuner(MeasurementInterface):
  myrank = 1
  def manipulator(self):
    """
    the msg from socket will be reiceived and then
    passed into the manipulator
    """
    scope = range(1000)
    manipulator = ConfigurationManipulator()
    try:
      count=0
      while count<1:
        data = sock.recv(100)
        if count==0:
          index = data
        elif count==1:
          rank = data
        count+=1
    finally:
      sock.close()
    print data
    manipulator.add_parameter(
      EnumParameter('index', scope))
    return manipulator

  def get_qor(self):
    filename = 'qor'+str(self.myrank)+'.txt'
    f = open(filename,'r')   
    lines = f.readlines()
    qor = lines[0]
    return float(qor)

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    #acquire configuration
    flag = 'index'
    type_config = ' '+str(cfg[flag])+' '
    index = cfg[flag]    
   
    sample_run = "python ./sample.py " + str(self.myrank) + " " + str(index)
    run_result = self.call_program(sample_run)
    assert run_result['returncode'] == 0

    result = self.get_qor()
    self.dumpresult(self.myrank,cfg,result)
    return Result(time = result)

  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data,
                                        'inline_config.json')
  def dumpresult(self, rank, cfg, res):
    """
    Compile and run a given configuration then
    return performance
    """
    f = open('./localresult'+str(rank)+'.txt','a')
    for key in cfg:
      f.write(str(key)+" "+str(cfg[key])+" ")
    f.write(str(res))
    f.write('\n')
    f.close()


if __name__ == '__main__':
  argparser = opentuner.default_argparser()
  ProgramTuner.main(argparser.parse_args())



