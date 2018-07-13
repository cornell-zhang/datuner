from opentuner import MeasurementInterface
from opentuner import Result
import subprocess, os

class ProgramTunerWrapper(MeasurementInterface):

  def get_qor(self):
    f = open('results.txt', 'r')
    while True:
      line = f.readline()
      if 'num_mem0' not in line.split():
        line = line.rstrip()
        results = line.split('\t')
        timing = results.pop(-1)
        timing = float(timing)
        break
    f.close()

    metadata = results
    return timing, metadata


  def run(self, desired_result, input, limit):
    """
    Compile and run a given configuration then
    return performance
    """
    abc_flags = [
      'resyn', 'resyn2', 'resyn3'
      ]

    vtr_pack_flags = [
      'alpha_clustering', 'beta_clustering',
      'allow_unrelated_clustering', 'connection_driven_clustering'
      ]

    vtr_place_flags = [
      'alpha_t', 'seed', 'inner_num', 'timing_tradeoff',
      'inner_loop_recompute_divider', 'td_place_exp_first',
      'td_place_exp_last'
      ]

    vtr_route_flags = [
      'max_router_iterations', 'initial_pres_fac', 'pres_fac_mult',
      'acc_fac', 'bb_factor', 'base_cost_type', 'astar_fac', 
      'max_criticality'
      ]

    cfg = desired_result.configuration.data
    result_id = desired_result.id

    designdir = self.designdir
    design = designdir.split('/')[-1].split('.')[0]
    archdir = self.archdir
    vtrpath = self.vtrpath
    target_cp = self.target_cp
    
    cp_file = target_cp + ".sdc"
    sdcFilewrite = open(cp_file, "w")
    sdcFilewrite.write("create_clock -period " + target_cp + " -waveform { 0 "+ str(float(target_cp)/2) +" } *") 
    sdcFilewrite.close()

    #generate configuration

    abc_config = " "
    run_abc_cmd = " "
    for flag in abc_flags:
      abc_config += flag + ' ' + str(cfg[flag]) + ' '
      if cfg[flag] == 'on':
        run_abc_cmd += '{0}; '.format(flag)

    vtr_config = " "
    run_vtr_cmd = " "
    for flag in vtr_pack_flags:
#      run_vtr_cmd += ' --' + flag + ' ' + str(cfg[flag])
      run_vtr_cmd += '    \"--' + flag + '\",       \"{0}\",'.format(cfg[flag])
      vtr_config += flag + ' ' + str(cfg[flag]) + ' '
    for flag in vtr_place_flags:
#      run_vtr_cmd += ' --' + flag + ' ' + str(cfg[flag])
      run_vtr_cmd += '    \"--' + flag + '\",       \"{0}\",'.format(cfg[flag])
      vtr_config += flag + ' ' + str(cfg[flag]) + ' '
    for flag in vtr_route_flags:
#      run_vtr_cmd += ' --' + flag + ' ' + str(cfg[flag])
      run_vtr_cmd += '    \"--' + flag + '\",       \"{0}\",'.format(cfg[flag])
      vtr_config += flag + ' ' + str(cfg[flag]) + ' '

    cmd = 'sed -e \'s:ABC_OTHER_OPTIONS:' + run_abc_cmd + ':g\' -e \'s:VPR_OTHER_OPTIONS:' + run_vtr_cmd + ':g\' -e \'s:VTR_FLOW_PATH:' + self.vtrpath + ':g\' ' + 'run_vtr_flow.pl > run_vtr_flow_new.pl'
    subprocess.Popen(cmd,shell=True).wait()
 
    cmd = 'chmod u+x run_vtr_flow_new.pl'
    subprocess.Popen(cmd,shell=True).wait()

    cmd = './run_vtr_flow_new.pl ' + designdir + ' ' + archdir + ' -sdc_file ' + os.getcwd() + '/' + cp_file + ' -keep_intermediate_files'
    subprocess.Popen(cmd,shell=True).wait()
    
    cmd = 'sed -e \'s:DESIGN_NAME:' + design + ':g\' parse.txt > parse_new.txt'
    subprocess.Popen(cmd, shell=True).wait()

    cmd = vtrpath + '/scripts/parse_vtr_flow.pl ./temp ./parse_new.txt > results.txt'
    subprocess.Popen(cmd, shell=True).wait()  
        
    result, metadata = self.get_qor()
    self.dumpresult(cfg, result, metadata)

#    cmd = 'rm results.txt'
#    subprocess.Popen(cmd, shell=True).wait()
    
    return Result(time = result)
