import logging
import re
import time
import sys
import os
import argparse
import thread
import adddeps
import opentuner
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result

class Wrapper(MeasurementInterface):
  def __init__(self, *pargs, **kwargs):
    super(Wrapper, self).__init__(*pargs,**kwargs)

  def manipulator(self,filename):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()

    import os.path
    if os.path.isfile(filename):
      f = open(filename,'r')
      while(1):
        line = f.readline()
        if not line: break
        buf = []
        buf = line.split()
        name = buf[0]
        paramType = buf[1]
        minval = buf[2]
        maxval = buf[3]
        optnum = buf[4]
        if paramType == "EnumParameter":
          opt = []
          for it in range(int(optnum)):
            opt.append(buf[5+it])
          manipulator.add_parameter(EnumParameter(name,opt))
        if paramType == "FloatParameter":
          manipulator.add_parameter(FloatParameter(name,float(minval),float(maxval)))
    return manipulator



  def dumpresult(self, rank, cfg, res):
    """
    Compile and run a given configuration then
    return performance
    """
    f = open('./localresult'+str(rank)+'.txt','a')
    for key in cfg:
      f.write(str(key)+" "+str(cfg[key])+" ")
    f.write(str(res[0]))
    f.write('\n')
    f.close()





