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
      if 'sgd,' in line:
        err_rate = line.strip('\n').split()[-1]
        continue
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
    
    if float(err_rate) > 10:
      LUT = 100000
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
      'INT_WIDTH_FEATURE',
      'FRA_WIDTH_FEATURE',
     # 'INT_WIDTH_DATA',
     # 'FRA_WIDTH_DATA',
      'INT_WIDTH_TMP',
      'FRA_WIDTH_TMP',
    ]
    
    int_list = [
     # 'INT_WIDTH_DATA2',
      'INT_WIDTH_LABEL'
     # 'INT_WIDTH_LABEL2'
    ]
    
    tot_list = [
      'TOT_WIDTH_FEATURE',
     # 'TOT_WIDTH_DATA',
      'TOT_WIDTH_TMP'
    ]
       
    cfg = desired_result.configuration.data
    result_id = desired_result.id
    
    # dump cfg in tcl
    f = open('./options.tcl', 'w')
    f.write('set CFLAGS "')
    for index in range(2):
      param_int = param_list[2*index]
      param_fra = param_list[2*index+1]
      value_tot = int(cfg[param_int]) + int(cfg[param_fra])
      f.write(' -D' + param_int  + '=' + str(cfg[param_int]))
      f.write(' -D' + tot_list[index] + '=' + str(value_tot))
    f.write(' -D' + int_list[0] + '=' + str(cfg[int_list[0]]))
    f.write('"\n')
    f.close()

    cmd = 'vivado_hls ./csim.tcl'
    #try:
    run_result = self.call_program(cmd)
    assert run_result['returncode'] == 0
    result, metadata = self.get_qor()
    #except:
    #  result = 100000
    #  metadata = [0,0,0,0,0]
    self.dumpresult(cfg, result, metadata)
    return Result(time = result)
