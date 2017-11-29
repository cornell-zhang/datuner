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
      if 'Average error:' in line:
        err_degree = float(line.strip('\n').split()[-2])
        continue
    f.close()
    if err_degree > 20.0:
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
      'BW1',
      'BW2',
      'BW3',
      'BW4',
      'BW5'
    ]
    
    cfg = desired_result.configuration.data
    result_id = desired_result.id
    
    # dump cfg in tcl
    f = open('./options.tcl', 'w')
    f.write('set CFLAGS "-DFIXED_TYPE')
    for index in param_list:
      f.write(' -D' + index  + '=' + str(cfg[index]))
    f.write('"\n')
    f.close()

    cmd = 'vivado_hls ./run.tcl'
    run_result = self.call_program(cmd)
    assert run_result['returncode'] == 0

    result, metadata = self.get_qor()
    self.dumpresult(cfg, result, metadata)
    return Result(time = result)
