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

argparser = argparse.ArgumentParser(add_help=False)
argparser.add_argument('--myrank', type=int, default=0, 
                       help='the rank of process')

#----------------------------------------
# Quartus parameter space
#----------------------------------------

options = {
    'map_effort' : 'effort',
    'map_ignore_carry_buffers' : 'ignore_carry_buffers',
    'map_ignore_cascade_buffers' : 'ignore_cascade_buffers',
    'map_optimize' : 'optimize',
    'map_state_machine_encoding' : 'state_machine_encoding',
    'fit_effort' : 'effort',
    'fit_one_fit_attempt' : 'one_fit_attempt',
    'fit_optimize_io_register_for_timing' : 'optimize_io_register_for_timing',
    'fit_pack_register' : 'pack_register',
    'fit_tdc' : 'tdc'
}

map_flags = []
fit_flags = []

with open("quartus_space.txt", 'r') as f:

  lines = f.readlines()
  i = 0
  j = 0
  for line in lines:
    is_map = line.find('map_')
    if not is_map == -1:
      map_flag = line[:line.find(' ')].rstrip()
      map_flags.append(map_flag) 
      i += 1
    is_fit = line.find('fit_')
    if not is_fit == -1:
      fit_flag = line[:line.find(' ')].rstrip()
      fit_flags.append(fit_flag)
      j += 1


class QUARTUSFlagsTuner(MeasurementInterface):
  
  design = 'BENCH_HOLDER'
  topmodule = 'TOPMODULE_HOLDER'
  workspace = 'WORKSPACE_HOLDER'
  designpath = 'DESIGNPATH_HOLDER'
  scriptpath = 'SCRIPTPATH_HOLDER'

  def __init__(self, *pargs, **kwargs):
    super(QUARTUSFlagsTuner, self).__init__(program_name="hello", 
                                            *pargs, **kwargs)

  def manipulator(self):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()
    filename = self.workspace + "/space" + str(self.args.myrank) + ".txt"
    if os.path.isfile(filename):
      f = open(filename, 'r')
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
          manipulator.add_parameter(EnumParameter(name, opt))
        if paramType == "FloatParameter":
          manipulator.add_parameter(FloatParameter(name, float(minval),
                                                   float(maxval)))
    return manipulator

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    start = time.time()
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    cmd = 'mkdir -p ' + self.workspace + '/' + str(self.args.myrank) + '/'
    subprocess.Popen(cmd, shell=True).wait()
    cmd = ('cp -r ' + self.designpath + ' ' + self.workspace + '/' +
           str(self.args.myrank) + '/')
    subprocess.Popen(cmd, shell=True).wait()
    cmd = ('mkdir -p ' + self.workspace + '/' + str(self.args.myrank) + '/' +
           str(result_id) + '/')
    subprocess.Popen(cmd, shell=True).wait()

    workdir = (self.workspace + '/' + str(self.args.myrank) + '/' + 
               str(result_id) + '/')
    srcdir = self.workspace + '/' + str(self.args.myrank) + '/' + self.design

    cfg = desired_result.configuration.data

    fname = workdir + "/options.tcl"
    f = open(workdir + '/options.tcl', 'w')

    #for tcl
    mapstr = 'execute_module -tool map -args "'
    fitstr = 'execute_module -tool fit -args "'
    stastr = 'execute_module -tool sta'

    #for result analysis
    mapres = ''
    fitres = ''
    
    for flag in map_flags:
      tcl_flag = options[flag]
      mapstr += '--' + tcl_flag + '=' + cfg[flag] + ' '
      mapres += flag + ' ' + cfg[flag] + ' '

    mapstr = mapstr.rstrip() + '"'
    mapres = mapres.rstrip()

    for flag in fit_flags:
      tcl_flag = options[flag]
      fitstr += '--' + tcl_flag + '=' + cfg[flag] + ' '
      fitres += flag + ' ' + cfg[flag] + ' '
    
    fitstr = fitstr.rstrip() + '"'
    fitres = fitres.rstrip()

    f.write(mapstr + '\n')
    f.write(fitstr + '\n')
    f.write(stastr + ' -args "--sdc=lab5_top.sdc"' + '\n')
    f.close()

    cmd = 'sed -e \'s:BENCH:' + self.design + \
          ':g\' -e \'s:TOPMODULE:' + self.topmodule + \
          ':g\' -e \'s:DESIGN_PATH:' + srcdir + \
          ':g\' -e \'s:WORKDIR_HOLDER:' + workdir + \
          ':g\' ' + self.scriptpath + '/eda_flows/quartus/run_quartus.tcl > ' \
          + workdir + 'run_quartus.tcl'
    subprocess.Popen(cmd, shell=True).wait()
    os.chdir(workdir)

    #------------run quartus---------#
    run_cmd = 'quartus_sh -t ' + workdir + '/run_quartus.tcl'
    #subprocess.call(run_cmd, shell=True)
    os.system(run_cmd + " > /dev/null")
    #-----------pass result---------#
    report_path = srcdir

    def get_timing():

      with open(report_path + '/' + self.topmodule + '.sta.rpt', 'r') as f:

        lines = f.readlines()

        timing_line = -1

        for i, line in enumerate(lines):
          header = re.match(r'\s*;\s*Multicorner Timing Analysis Summary\s*;.*',
                            line)
          if header:
            timing_line = i
            break

        if timing_line == -1:
          print 'Cannot find specified header'
          exit(-1)

        timing_found = False

        for i, line in enumerate(lines[timing_line:]):
          clk = re.match(r'\s*;\s*CLK\s*;.*', line)
          if clk:
            timing       = re.sub(r'\s*;\s*CLK\s*;\s*(\S*)\s*;.*', r'\1', line)
            timing_found = True
            break

        if not timing_found:
          print 'Cannot find slack'
          exit(-5)

      return timing
      
    def get_utilization():

      with open(report_path + '/' + self.topmodule + '.fit.rpt', 'r') as f:

        lines = f.readlines()

        j = -1

        for line in lines:
          
          j += 1
          if not line.find('; Fitter Resource Usage Summary') == -1:
            break

        lines = lines[j:]

        line_num = -1

        for line in lines:

          line_num += 1
          lut_pos = line.find("ALUT")
          if not lut_pos == -1:
            lut_line = line_num
            break

        for line in lines[line_num+1:]:

          line_num += 1
          register_pos = line.find("logic registers")
          if not register_pos == -1:
            register_line = line_num
            break

        for line in lines[line_num+1:]:

          line_num += 1
          ram_pos = line.find("M10K")
          if not ram_pos == -1:
            ram_line = line_num
            break

        for line in lines[line_num+1:]:

          line_num += 1
          dsp_pos = line.find("DSP")
          if not dsp_pos == -1:
            dsp_line = line_num
            break


        lut = lines[lut_line]
        lut = lut[2:]
        lut = lut[lut.find('; ')+2:]
        lut = lut[:lut.find(';')].rstrip()

        register = lines[register_line]
        register = register[2:]
        register = register[register.find('; ')+2:]
        register = register[:register.find(';')].rstrip()

        ram = lines[ram_line]
        ram = ram[2:]
        ram = ram[ram.find('; ')+2:]
        ram = ram[:ram.find('/')].rstrip()

        dsp = lines[dsp_line]
        dsp = dsp[2:]
        dsp = dsp[dsp.find('; ')+2:]
        dsp = dsp[:dsp.find('/')].rstrip()

      return lut, register, ram, dsp

    my_timing = get_timing()
    my_lut, my_register, my_ram, my_dsp = get_utilization() 

    end = time.time()

    my_timing = float(my_timing) * -1

    myscore = my_timing 

    os.chdir(self.workspace)
    writename = './result_' + str(self.args.myrank) + '.txt'
    f = open(writename, 'a')
    f.write('Configuration: ' + mapres + ' ' + fitres)
    rt = str(end - start)
    f.write(" RT: " + rt)
    f.write(" LUT: " + my_lut + "  Reg: " + my_register +
            "  Ram: " + my_ram + "  DSP:  " + my_dsp)
    f.write(" WNS: " + str(my_timing))
    f.write(" \n")
    f.close()

    writename = './localresult' + str(self.args.myrank) + '.txt'
    f = open(writename, 'a')
    f.write('Configuration: ' + mapres + ' ' + fitres)
    f.write(' WNS ' + str(my_timing))
    f.write("\n")
    f.close()

    return Result(time=myscore)


if __name__ == '__main__':
  argparsers = opentuner.argparsers()
  argparsers.append(argparser)
  totalparser = argparse.ArgumentParser(parents=argparsers)
  args = totalparser.parse_args()

  mycmd = 'rm -f ./localresult' + str(args.myrank) + '.txt'
  subprocess.call(mycmd, shell=True)

  QUARTUSFlagsTuner.main(args)
