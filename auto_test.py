import os
import platform

s = platform.system()
a = platform.machine()

pwd = os.getcwd()
vtr_path = pwd + '/build/pkgs/vtr/vtr_release/vtr_flow'
workspace_path = pwd + '/build_test'
os.environ["DATUNER_HOME"] = pwd

try:
  os.makedirs(workspace_path)
except:
  pass

test_config_file = pwd  + '/auto_cfg.py'
config_out = workspace_path + '/vtr.py'

# update config file
f1 = open(test_config_file, 'r')
f2 = open(config_out, 'w')
for line in f1:
    line = line.replace('vtrpath_holder', vtr_path)
    line = line.replace('workspace_holder', workspace_path)
    line = line.replace('machine_holder', platform.node())
    line = line.replace('server_holder', platform.node())
    f2.write(line)
f1.close()
f2.close()

# run datuner
os.chdir(workspace_path)
os.system('python -O ../src/datuner.py -f vtr -p 1 -b 4 -t 0.0d:360s')

# check results

# make sure glocal_result.txt and result.db exist
assert os.path.isfile(workspace_path + '/global_result.txt')
assert os.path.isfile(workspace_path + '/results.db')

# make sure DATuner terminates normally
# assert 'finish tuning' in open(workspace_path + '/datuner.db/vtr/diffeq1/tune.log').read()
