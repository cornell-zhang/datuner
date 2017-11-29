from opentuner import MeasurementInterface
from opentuner import Result

class ProgramTunerWrapper(MeasurementInterface):

  def get_qor(self):
    f = open('qor.txt', 'r')
    return float(f.readlines()[0])

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    cfg = desired_result.configuration.data
    result_id = desired_result.id

    # acquire configuration
    x, y, z = cfg['x'], cfg['y'], cfg['z']
    sample_run = 'python ./sample.py ' + str(x) + ' ' + str(y) + ' ' + str(z)
    run_result = self.call_program(sample_run)
    assert run_result['returncode'] == 0

    result = self.get_qor()
    self.dumpresult(cfg, result)
    return Result(time = result)
