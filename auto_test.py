import os
import platform

pwd = os.getcwd()
vtr_path = pwd + '/build/pkgs/vtr/vtr_release/vtr_flow'
workspace_path = pwd + '/build_test'
try:
  os.makedirs(workspace_path)
except:
  pass

s = platform.system()
a = platform.machine()

script_folder = pwd + '/releases/' + platform.system() + '_' + platform.machine() + '/scripts'
test_config_file = script_folder + '/tests/vtr.py'
config_out = workspace_path + '/vtr.py'

# update hostname
f = open(script_folder + '/my_hosts', 'w')
f.write(platform.node())
f.close()

# update config file
f1 = open(test_config_file, 'r')
f2 = open(config_out, 'w')
for line in f1:
    line = line.replace('vtr_flow_holder', vtr_path)
    f2.write(line)
f1.close()
f2.close()

# run datuner
os.chdir(workspace_path)
os.system('datuner.py -f vtr -p 1 -b 1 -t 0.0d:20s')

# check results

# make sure tune.log and results/result.db exist
assert os.path.isfile(workspace_path + '/datuner.db/vtr/diffeq1/tune.log')
assert os.path.isfile(workspace_path + '/datuner.db/vtr/diffeq1/results/result.db')

# make sure DATuner terminates normally
assert 'finish tuning' in open(workspace_path + '/datuner.db/vtr/diffeq1/tune.log').read()
