import os
import platform

pwd = os.getcwd()
vtr_path = pwd + '/build/pkgs/vtr/vtr_release/vtr_flow'
workspace_path = pwd + '/build_test/'

s = platform.system()
a = platform.machine()

script_folder = pwd + '/releases/' + platform.system() + '_' + platform.machine() + '/scripts'
test_init_file = script_folder + '/tests/run_init_temp.py'
init_out = script_folder + '/run_init.py'

# update hostname
f = open(script_folder + '/my_hosts', 'w')
f.write(platform.node())
f.close()

# update config file
f1 = open(test_init_file, 'r')
f2 = open(init_out, 'w')
for line in f1:
    line = line.replace('vtr_flow_holder', vtr_path)
    line = line.replace('workspace_holder', workspace_path)
    f2.write(line)
f1.close()
f2.close()

# run opentuner
os.system('python ' + init_out)

# check results

# make sure tune.log and results/result.db exist
assert os.path.isfile(workspace_path + '/vtr/diffeq1/tune.log')
assert os.path.isfile(workspace_path + '/vtr/diffeq1/results/result.db')

# make sure DATuner terminates normally
assert 'finish tuning' in open(workspace_path + '/vtr/diffeq1/tune.log').read()
