from opentuner import MeasurementInterface
from opentuner import Result

class ProgramTunerWrapper(MeasurementInterface):

  def get_qor(self):
    f = open('qor.txt', 'r')
    lut_count = 0.0
    while True:
      line = f.readline()
      if not line: break
      if 'nd' in line.split():
        lut_count = line.split('=')[3].split()[0]
        break
    f.close()
    return float(lut_count)

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    # acquire configuration
    cmd = 'abc -c \"read priority.blif;strash;'
    for param_id in range(5):
      cmd += cfg['param_' + str(param_id)] + ';'
    cmd += 'if -a -K 6;print_stats \" > qor.txt'
    run_result = self.call_program(cmd)
    assert run_result['returncode'] == 0

    result = self.get_qor()
    self.dumpresult(cfg, result)
    return Result(time = result)
