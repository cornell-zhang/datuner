from opentuner import MeasurementInterface
from opentuner import Result

class ProgramTunerWrapper(MeasurementInterface):

  def get_qor(self):
    f = open('sta.summary', 'r')
    while True:
      line = f.readline()
      if "Slack" in line.split():
        slack = line.split(':')[1]
        break
    f.close()
    return -float(slack)

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    map_param = [
      'effort', 
      'ignore_carry_buffers', 
      'ignore_cascade_buffers', 
      'optimize', 
      'state_machine_encoding'
    ]
    fit_param = [
      'effort',
      'one_fit_attempt',
      'optimize_io_register_for_timing',
      'pack_register',
      'tdc'
    ]

    cfg = desired_result.configuration.data
    result_id = desired_result.id

    f = open('./options.tcl', 'w')
    f.write('execute_module -tool map -args "')
    for param in map_param:
      f.write('--' + param + '=' + cfg['map_' + param] + ' ')
    f.write('"\n')
    f.write('execute_module -tool fit -args "')
    for param in fit_param:
      f.write('--' + param + '=' + cfg['fit_' + param] + ' ')
    f.write('"\n')
    f.close()

    cmd = 'quartus_sh -t ./run_quartus.tcl'
    run_result = self.call_program(cmd)
    assert run_result['returncode'] == 0

    result = self.get_qor()
    self.dumpresult(cfg, result)
    return Result(time = result)
