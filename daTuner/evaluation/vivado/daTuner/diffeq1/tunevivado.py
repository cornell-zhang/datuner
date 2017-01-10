#/usr/bin/env python
import adddeps
import logging
import re
import time
import sys
import os
import argparse
import thread

import opentuner
from opentuner import ConfigurationManipulator
from opentuner import EnumParameter
from opentuner import IntegerParameter
from opentuner import FloatParameter
from opentuner import MeasurementInterface
from opentuner import Result


Physoptdesign_flags = [
  'fanout_opt',
  'placement_opt',
  'critical_cell_opt',
  'retime',
  'rewire',
  'critical_pin_opt'
  ]


class VIVADOFlagsTuner(MeasurementInterface):
  def __init__(self, *pargs, **kwargs):
    super(VIVADOFlagsTuner, self).__init__(program_name="hello", *pargs, **kwargs)
    self.parallel_compile = False

  def manipulator(self):
    """
    Define the search space by creating a
    ConfigurationManipulator
    """
    manipulator = ConfigurationManipulator()

    print self.args.rank

    import os.path
    bench='diffeq1'
    exp_type='daTuner'
    spacepath='/home/xuchang/nas/project/daTuner/evaluation/vivado//daTuner/diffeq1'

    filename=spacepath+"/space"+str(self.args.rank)+".txt"
    if os.path.isfile(filename):
      f = open(filename,'r')
      while(1):
        line = f.readline()
        #print line
        if not line: break
        buf = []
        buf = line.split()
        name = buf[0]
        paramType = buf[1]
        default = buf[2]
        minval = buf[3]
        maxval = buf[4]
        optnum = buf[5]
        if paramType == "EnumParameter":
          opt = []
          for it in range(int(optnum)):
            opt.append(buf[6+it])
          manipulator.add_parameter(EnumParameter(name,opt))
        if paramType == "FloatParameter":
          manipulator.add_parameter(FloatParameter(name,float(minval),float(maxval)))

    print "finish setting manipulator"

    return manipulator


  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    print "debug result_id"
    print desired_result.id
    result_id = desired_result.id

    start = time.time()
    bench = 'diffeq1'
    exp_type = 'daTuner'
    spacepath = '/home/xuchang/nas/project/daTuner/evaluation/vivado//daTuner/diffeq1'
    designpath = '/home/xuchang/nas/project/daTuner/evaluation/vivado_design/'

    cmd='mkdir '+spacepath+'/rank'+str(self.args.rank)+'/'
    import subprocess
    subprocess.Popen(cmd,shell=True).wait()
    workdir = spacepath+'/rank'+str(self.args.rank)+'/'


    cfg = desired_result.configuration.data

    ldir = workdir
    fname = ldir+"/options.tcl"
    f = open(ldir+'/options.tcl','w')
    #for tcl
    optstr = 'opt_design -directive'
    placestr = 'place_design -directive'
    physoptstr = 'phys_opt_design'
    routestr = 'route_design -directive'

    #for result analysis
    optres = 'opt_design directive '
    placeres = 'place_design directive '
    physoptres = 'phys_opt_design '
    routeres = 'route_design directive '

    optres += ' '+cfg["Optdirective"]+' '
    optstr += ' '+cfg["Optdirective"]
    placeres += ' '+cfg['Placedirective']+' '
    placestr += ' '+cfg['Placedirective']
    for flag in Physoptdesign_flags:
      if cfg[flag] == 'on':
        physoptres += ' '+flag+'  on  '
      else:
        physoptres += ' '+flag+'  off  '

      if cfg[flag] == 'off':
        continue
      physoptstr += ' -'+flag

    routeres += ' '+cfg['Routedirective']+' '
    routestr += ' '+cfg['Routedirective']

    f.write(optstr+'\n')
    f.write(placestr+'\n')
    f.write(physoptstr+'\n')
    f.write(routestr+'\n')
    f.close()

    tunetiming = args.tunecst
    print "debug tunecst: "+str(tunetiming)
    cstset = args.defaultcst
    if tunetiming == 1:
      cstset = cfg['Timingcst']

    xdc_path = designpath+'/'+bench+'/'
    cmd= 'sed -e \'s:PERIOD_HOLDER:'+str(cstset)+':g\' '+xdc_path+'design_template.xdc > '+ldir+'design.xdc'
    import subprocess
    subprocess.Popen(cmd,shell=True).wait()


    wns = 0.0
    SLUT=str(0)
    SReg=str(0)
    BRam=str(0)
    DSP=str(0)

    if False:
      wns = -10000

    if True:
      print "Running Vivado...\n"
      print result_id
      tcldir = designpath+'/'+bench+'/'
      cmd=' sed -e \'s:BENCH_HOLDER:'+bench+':g\' -e \'s:EXPTYPE:'+exp_type+':g\' -e \'s:PATH_HOLDER:'+spacepath+':g\' -e \'s:DESIGN_PATH:'+designpath+':g\' -e \'s:RANK_HOLDER:'+str(self.args.rank)+':g\' '+tcldir+'/run_vivado.tcl >'+ldir+'run_vivado.tcl'
      import subprocess
      subprocess.Popen(cmd,shell=True).wait()

      run_cmd = 'vivado -mode batch -source '+ ldir+ '/'+ 'run_vivado.tcl'
#+exp_type+'_'+str(self.args.rank)+'.tcl'
      print run_cmd
      logging.debug("run_cmd" + run_cmd)
      #run_result = self.call_program(run_cmd)
      import subprocess
      subprocess.call(run_cmd,shell=True)
      print "Finish running Vivado...\n"

      import os.path
      timingFile=ldir + '/' + 'output/post_route_timing.rpt'
      if os.path.isfile(timingFile):
        f = open(timingFile)
        while 1:
          line = f.readline()
          if line.find('Startpoint') != -1:
            f.readline()
            singleLine = f.readline()
            bufs = singleLine.split()
            i = len(bufs)
            if i >= 3:
              wns = float(bufs[2])
            else:
              while 1:
                singleLine = f.readline()
                bufs = singleLine.split()
                if len(bufs)+i >= 3:
                  wns = float(bufs[2-i])
                  break
                i = i+len(bufs)
            break
        f.close()
      else:
        wns=-10000


      ResourceFile = ldir + '/' +'output/post_route_util.rpt'
      if os.path.isfile(ResourceFile):
        blockFlag = False
        f = open(ResourceFile)
        while 1:
          line = f.readline()
          if not line: break
          if line.find('Slice LUTs')!=-1:
            bufs = line.split("| ")
            SLUT = bufs[2]
          if line.find('Slice Registers')!=-1:
            bufs = line.split("| ")
            SReg = bufs[2]
          if line.find('Block RAM Tile') != -1 and blockFlag != True:
            bufs = line.split("| ")
            BRam = bufs[2]
            blockFlag = True
          if line.find('DSPs')!=-1:
            bufs = line.split("| ")
            DSP = bufs[2]
        f.close()


    end = time.time()

    myscore = wns
    if tunetiming == 1:
      if wns != -10000:
        myscore = -(cstset-wns)

    writename='./result'+str(self.args.rank)+'.txt'
    f = open(writename,'a')
    f.write('Configuration: '+optres+' '+placeres+' '+physoptres+' '+routeres+' '+'Timingcst '+str(cstset))
    f.write(" WNS:  ")
    f.write(str(myscore))
    rt = str(end - start)
    f.write(" RT: "+rt)
    f.write(" SLUT: "+SLUT+"  SReg: "+SReg+"  BRam: "+BRam+"  DSP:  "+DSP)
    f.write(" \n")
    f.close()


    writename='./localresult'+str(self.args.rank)+'.txt'
    f = open(writename,'a')
    f.write('Configuration: '+optres+' '+placeres+' '+physoptres+' '+routeres+' '+'Timingcst '+str(cstset))
    f.write(' WNS '+str(myscore))
    f.write("\n")
    f.close()

    return Result(time=-myscore)


  def save_final_config(self, configuration):
    """called at the end of tuning"""
    print "Optimal b01 options written to bench_config.json:", configuration.data
    self.manipulator().save_to_file(configuration.data,
                                    'inline_config.json')
    #mycmd='rm ./StartPointSpace'+str(args.rank)+'.json'
    #subprocess.call(mycmd,shell=True)

  @classmethod
  def fake_main(cls):
    argparser = opentuner.default_argparser()
    args = argparser.parse_args()
    VIVADOFlagsTuner.main(args)

if __name__ == '__main__':
  argparser = opentuner.default_argparser()
  args = argparser.parse_args()
  mycmd='rm ./localresult'+str(args.rank)+'.txt'
  import subprocess
  subprocess.call(mycmd,shell=True)

  VIVADOFlagsTuner.main(args)
