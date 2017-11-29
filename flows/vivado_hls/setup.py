import xml.etree.ElementTree
from opentuner import MeasurementInterface
from opentuner import Result

class ProgramTunerWrapper(MeasurementInterface):
  def get_qor(self):
    """ return qor & [BRAM, FF, LUT, DSP]"""

    filename = 'vivado_hls.log'
    f = open(filename, 'r')
    while True:
      line = f.readline()
      if not line: break
      if 'LUT:' in line: 
        LUT = line.strip('\n').split()[-1]
        continue
      if 'FF:' in line:
        FF = line.strip('\n').split()[-1]
        continue
      if 'DSP' in line:
        DSP = line.strip('\n').split()[-1]
        continue
      if 'BRAM:' in line:
        BRAM = line.strip('\n').split()[-1]
        continue
      if 'achieved post-implementation' in line:
        timing = line.strip('\n').split()[-1]
        continue
    f.close()
    
    outlog = 'cordic.prj/solution1/csim/build/out.dat'
    f = open(outlog, 'r')
    while True:
      line = f.readline()
      if not line: break
      if 'Overall_Error_Sin' in line:
        err_sin = line.strip('\n').split()[-1]
        continue
      if 'Overall_Error_Cos' in line: 
        err_cos = line.strip('\n').split()[-1]
        continue
    f.close()
    err_rate = (float(err_sin) + float(err_cos))/2.0
    if err_rate > 5:
      LUT = 10000
    else: 
      pass
    metadata = [FF, DSP, BRAM, timing, err_rate]
    #e = xml.etree.ElementTree.parse(filename).getroot()
    #for item in e.iter('EstimatedClockPeriod'):
    #  timing = item.text
    #metadata = []
    #for tag in e.iter('Resources'):
    #  for item in tag.getchildren():
    #    metadata.append(item.text)
    return float(LUT), metadata

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """

    param_list = [
      'INT_WIDTH_THETA',
      'FRA_WIDTH_THETA',
      'INT_WIDTH_COS',
      'FRA_WIDTH_COS',
      'INT_WIDTH_SIN',
      'FRA_WIDTH_SIN'
    ]
    
    tot_list = [
      'TOT_WIDTH_THETA',
      'TOT_WIDTH_COS',
      'TOT_WIDTH_SIN'
    ]
       
    cfg = desired_result.configuration.data
    result_id = desired_result.id
    
    # dump cfg in tcl
    f = open('./options.tcl', 'w')
    f.write('set CFLAGS "-DFIXED_TYPE')
    for index in range(3):
      param_int = param_list[2*index]
      param_fra = param_list[2*index+1]
      value_tot = int(cfg[param_int]) + int(cfg[param_fra])
      f.write(' -D' + param_int  + '=' + str(cfg[param_int]))
      f.write(' -D' + tot_list[index] + '=' + str(value_tot))
    f.write('"\n')
    f.close()

    cmd = 'vivado_hls ./run_fixed.tcl'
    run_result = self.call_program(cmd)
    assert run_result['returncode'] == 0

    result, metadata = self.get_qor()
    self.dumpresult(cfg, result, metadata)
    return Result(time = result)
