#!/bin/bash

if [ "$#" -ne 3 ]; then
   echo "./runone.sh <design> <time> <exp_type my|whole|restart>"
   exit
fi

design=$1
defaulttime=$2
exp_type=$3
limit=10
if [ "$exp_type" = "whole" ]; then
  limit=300
fi

echo $exp_type 

path=/proj/xsjhdstaff3/changx/project/parTuner/experiment/vpr/vtr_release/vtr_flow/tasks/openTunerTiming/experiment/$exp_type/
mkdir $path
mkdir $path/$design
cd $path/$design
rm -r opentuner.db
rm log
cd $path/../template

cp ./adddeps.py my_hosts $path/$design
ln -s /proj/xsjhdstaff3/changx/project/parTuner/parTuner/bin/worker.debug $path/$design/worker.debug
ln -s /proj/xsjhdstaff3/changx/project/parTuner/parTuner/bin/master.debug $path/$design/master.debug
sed -e "s/BENCH_HOLDER/$design/g" -e "s/EXPTYPE/$exp_type/g" ./tuneVPR.py > $path/$design/tuneVPR.py


cd $path/$design

if [ "$exp_type" = "my" ];then
  mpirun -np 1 ./master.debug -vpr -best  : -np 8 --hostfile my_hosts ./worker.debug -design $design  --parallelism=1  >log 
else
  mpirun -np 1 ./master.debug -$exp_type -vpr -best : -np 8 --hostfile my_hosts ./worker.debug -design $design  --parallelism=1  >log 
fi

cd $path/../template





