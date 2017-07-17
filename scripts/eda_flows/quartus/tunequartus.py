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
argparser.add_argument('--myrank',type=int, default=0,
    help='the rank of process')

#----------------------------------------
# Vivado parameter space
#----------------------------------------
map_flags = [
  'map_effort',
  'map_incremental_compilation',
  'map_optimize',
  'map_parallel'
  ]

fit_flags = [
  'fit_effort',
  'fit_optimize_io_register_for_timing',
  'fit_pack_register',
  'fit_tdc'
  ]

class QUARTUSFlagsTuner(MeasurementInterface):
  design='BENCH_HOLDER'
  topmodule='TOPMODULE_HOLDER'
  workspace='WORKSPACE_HOLDER'
  designpath='DESIGNPATH_HOLDER'
  scriptpath='SCRIPTPATH_HOLDER'

  def __init__(self, *pargs, **kwargs):
    super(QUARTUSFlagsTuner, self).__init__(program_name="hello", *pargs, **kwargs)

  def manipulator(self):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()
    filename=self.workspace+"/space"+str(self.args.myrank)+".txt"
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


  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    start = time.time()
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    cmd='mkdir -p '+self.workspace+'/'+str(self.args.myrank)+'/'
    subprocess.Popen(cmd,shell=True).wait()
    cmd='mkdir -p '+self.workspace+'/'+str(self.args.myrank)+'/'+str(result_id)+'/'
    subprocess.Popen(cmd,shell=True).wait()

    workdir = self.workspace+'/'+str(self.args.myrank)+'/'+str(result_id)+'/'
    #srcdir = self.designpath+'/'+self.design+'/'
    srcdir = self.designpath+'/'

    cfg = desired_result.configuration.data

    fname = workdir+"/options.tcl"
    f = open(workdir+'/options.tcl','w')

    #for tcl
    mapstr = 'execute_module -tool map -args'
    fitstr = 'execute_module -tool fit -args'
    stastr = 'execute_module -tool sta'

    #for result analysis
    mapres = 'quartus_map'
    fitres = 'quartus_fit'
    
    for flag in map_flags:
      tcl_flag = flag[4:]
      mapstr += ' --'+tcl_flag+'='+cfg[flag]
      mapres += ' '+tcl_flag+' '+cfg[flag]
    for flag in fit_flags:
      tcl_flag = flag[4:]
      fitstr += ' --'+tcl_flag+'='+cfg[flag]
      fitres += ' '+tcl_flag+' '+cfg[flag]

    f.write(mapstr+'\n')
    f.write(fitstr+'\n')
    f.write(stastr+'\n')
    f.close()

    cmd = 'sed -e \'s:BENCH:'+self.design+':g\' -e \'s:TOPMODULE:'+self.topmodule+':g\' -e \'s:DESIGN_PATH:'+self.designpath+':g\' -e \'s:WORKDIR_HOLDER:'+workdir+':g\' '+self.scriptpath+'/eda_flows/quartus/run_quartus.tcl > '+workdir+'run_quartus.tcl'
    subprocess.Popen(cmd,shell=True).wait()
    os.chdir(workdir)

    #------------run quartus---------#
    run_cmd = 'quartus_sh -t '+workdir+'/run_quartus.tcl'
    subprocess.call(run_cmd,shell=True)

    #-----------pass result---------#
   
    report_path = "/work/zhang/users/eu49/datuner/releases/Linux_x86_64/scripts/eda_flows/quartus/design/proc"

    def get_timing():

      with open(report_path+"/lab5_top.sta.rpt", 'r') as f:

        lines = f.readlines()

        line_num = -1

        for line in lines:

          line_num+=1

          clock_pos=line.find("; Period ;")
          if not clock_pos==-1:
            clock_line = line_num+2
            break

        for line in lines[line_num+1:]:

          line_num+=1

          timing_pos=line.find("Worst-case Slack")
          if not timing_pos==-1:
            timing_line = line_num
            break

        clock = lines[clock_line]
        clock = clock[2:]
        i = 0
        while (i < 2):
          clock = clock[clock.find('; ')+2:]
          i += 1
        clock = clock[:clock.find(';')].rstrip()

        timing = lines[timing_line]
        timing = timing[2:]
        timing = timing[timing.find('; ')+2:]
        timing = timing[:timing.find(';')].rstrip()

    def get_utilization():

      with open(report_path+"/lab5_top.fit.rpt", 'r') as f:

        lines = f.readlines()

        j=-1

        for line in lines:
          j += 1
          if not line.find('; Fitter Resource Usage Summary')==-1:
            break

        lines=lines[j:]

        line_num = -1

        for line in lines:

          line_num+=1

          lut_pos=line.find("ALUT")
          if not lut_pos==-1:
            lut_line = line_num
            break

        for line in lines[line_num+1:]:

          line_num+=1

          register_pos=line.find("logic registers")
          if not register_pos==-1:
            register_line = line_num
            break

        for line in lines[line_num+1:]:

          line_num+=1

          ram_pos=line.find("M10K")
          if not ram_pos==-1:
            ram_line = line_num
            break

        for line in lines[line_num+1:]:

          line_num+=1

          dsp_pos=line.find("DSP")
          if not dsp_pos==-1:
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

        
    def main():

      get_timing()
      get_utilization()

    if __name__=='__main__':
      main()



    myscore = timing*-1 

    os.chdir(self.workspace)
    writename='./result_'+str(self.args.myrank)+'.txt'
    f = open(writename,'a')
    f.write('Configuration: '+mapres+' '+fitres)
    rt = str(end - start)
    f.write(" RT: "+rt)
    f.write(" Period: "+clock+"  WNS: "+timing)
    f.write(" LUT: "+lut+"  Reg: "+register+"  Ram: "+ram+"  DSP:  "+dsp)
    f.write(" QoR: "str(myscore))
    f.write(" \n")
    f.close()


    writename='./localresult'+str(self.args.myrank)+'.txt'
    f = open(writename,'a')
    f.write('Configuration: '+mapres+' '+fitres)
    f.write(' WNS '+str(myscore))
    f.write("\n")
    f.close()

    return Result(time=myscore)

if __name__ == '__main__':
  argparsers = opentuner.argparsers()
  argparsers.append(argparser)
  totalparser = argparse.ArgumentParser(parents=argparsers)
  args = totalparser.parse_args()

  mycmd='rm -f ./localresult'+str(args.myrank)+'.txt'
  subprocess.call(mycmd,shell=True)

QUARTUSFlagsTuner.main(args)
