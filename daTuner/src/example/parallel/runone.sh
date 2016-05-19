#!/bin/bash

if [ "$#" -ne 6 ]; then
  echo "Usage: <tech><design><type multiCPU|thread><procnum><test-limit><nomsg|msg>"
  exit
fi

#which technique to use. Use python ./runTuner.py -lt to list all the techniques
tech=$1
design=$2
#specify whether run in parallel or serial
plat=$3
#the number of process to use
num=$4
#the number of iterations to search
testLimit=$5
#paralell with or w/o message passing
msg=$6
#which machine to run
machine="03"
#combine to rename workspace
exptype=$plat-$num-$msg

mkdir experiment
mkdir experiment/$exptype
mkdir experiment/$exptype/$tech
mkdir experiment/$exptype/$tech/$design #workspace

cp ./hostfile ./adddeps.py   ./experiment/$exptype/$tech/$design
sed -e "s/DESIGN_HOLDER/$design/g" -e "s/EXPTYPE_HOLDER/$exptype/g" -e "s/TECH_HOLDER/$tech/g" ./tuneVPR.py  >  ./experiment/$exptype/$tech/$design/tuneVPR.py
sed -e "s/MSG_HOLDER/$msg/g"  ./runTuner.py > ./experiment/$exptype/$tech/$design/runTuner.py

runhost="--hostfile hostfile"
if [ $plat == "thread" ];then
  runhost="--host zhang-${machine}.ece.cornell.edu"
fi

cd experiment/$exptype/$tech/$design  
mpirun $runhost -n $num python runTuner.py  --technique=$tech --parallelism 1 --test-limit $testLimit |&tee log 2>&1 

cd ../../../../


