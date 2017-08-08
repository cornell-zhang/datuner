PREFIX="$(./DATuner_uname -s)_$(./DATuner_uname -a)"
export PATH=$(pwd)/releases/$PREFIX/install/bin:$(pwd)/releases/$PREFIX/scripts:$PATH
export LD_LIBRARY_PATH=$(pwd)/releases/$PREFIX/install/lib:$LD_LIBRARY_PATH
