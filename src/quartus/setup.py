from opentuner import MeasurementInterface
from opentuner import Result
import subprocess
import time

class ProgramTunerWrapper(MeasurementInterface):

  def get_qor(self, sweepparam):
    # f = open('sta.summary', 'r')
    # while True:
    #   line = f.readline()
    #   if "Slack" in line.split():
    #     slack = line.split(':')[1]
    #     break
    # f.close()

    # f = open('fit.summary', 'r')
    # while True:
    #   line = f.readline()
    #   if not line: break
    #   if 'Combinational ALUTs' in line:
    #     comb_alut = line.split(':')[1].split('/')[0].rstrip().lstrip()
    #     continue
    #   if 'Memory ALUTs' in line:
    #     mem_alut = line.split(':')[1].split('/')[0].rstrip().lstrip()
    #     continue
    #   if 'Total registers' in line:
    #     reg = line.split(':')[1].split('/')[0].rstrip().lstrip()
    #     continue
    #   if 'block memory bits' in line:
    #     bram = line.split(':')[1].split('/')[0].rstrip().lstrip()
    #     continue
    #   if 'DSP block' in line:
    #     dsp = line.split(':')[1].split('/')[0].rstrip().lstrip()
    #     continue
    # f.close()

    # metadata = [comb_alut, mem_alut, reg, bram, dsp]
    # return -float(slack), metadata
    return 0.123, [sweepparam, '2', '3', '4', '5']

  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    map_param = ['optimize']
    fit_param = []
    #map_param = [
    #  'effort', 
    #  'ignore_carry_buffers', 
    #  'ignore_cascade_buffers', 
    #  'optimize', 
    #  'state_machine_encoding'
    #]
    #fit_param = [
    #  'effort',
    #  'one_fit_attempt',
    #  'optimize_io_register_for_timing',
    #  'pack_register',
    #  'tdc'
    #]

    cfg = desired_result.configuration.data
    result_id = desired_result.id

    f = open('./options.tcl', 'w')
    f.write('execute_module -tool map -args "--family=stratixiv --part=EP4SGX530NF45I3 ')
    for param in map_param:
      f.write('--' + param + '=' + cfg['map_' + param] + ' ')
    f.write('"\n')
    f.write('execute_module -tool fit -args "--part=EP4SGX530NF45I3 ')
    for param in fit_param:
      f.write('--' + param + '=' + cfg['fit_' + param] + ' ')
    f.write('"\n')
    f.close()

    if 'sweepparam' in cfg:
        # delete previous results
        cleanupcmd = 'rm localresult.txt'
        subprocess.Popen(cleanupcmd, shell=True).wait()

        # generate verilog design file; this is to integrate the libcharm genverilog scripts
        sweepparam = int(cfg['sweepparam'])
        genveri = 'cd design; python genVerilogMultiplier.py ' + str(sweepparam) + ' ' + str(sweepparam + 1) + ' 1; cd ..'
        subprocess.Popen(genveri, shell=True).wait()

        print "Starting " + cfg['sweepparam']
        tclmodcmd = 'sed \'s/SWEEPPARAM/BITS ' + cfg['sweepparam'] + '/g\' run_quartus.tcl > run_quartus_sweep.tcl'
        subprocess.Popen(tclmodcmd, shell=True).wait()
        #cmd = 'quartus_sh -t ./run_quartus_sweep.tcl'
        cmd = 'ls'
        run_result = self.call_program(cmd)
        assert run_result['returncode'] == 0
        result, metadata = self.get_qor(cfg['sweepparam'])
        self.dumpresult(cfg, cfg['sweepparam'], result, metadata)
        cleanupcmd = 'rm run_quartus_sweep.tcl'
        subprocess.Popen(cleanupcmd, shell=True).wait()
        print "Finished " + cfg['sweepparam']
    else:
        cmd = 'quartus_sh -t ./run_quartus.tcl'
        run_result = self.call_program(cmd)
        assert run_result['returncode'] == 0

        result, metadata = self.get_qor()
        self.dumpresult(cfg, result, metadata)

    return Result(time = result)