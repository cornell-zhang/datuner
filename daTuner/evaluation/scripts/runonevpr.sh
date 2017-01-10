#!/bin/bash

if [ "$#" -ne 1 ]; then
   echo "./runone.sh <design>"
   exit
fi

design=$1
app=vpr
exp_type=daTuner

#replace with your path
path=/home/xuchang/nas/project/daTuner/evaluation/
vprpath=/home/xuchang/nas/project/daTuner/experiment/vtr_release/vtr_flow/

path=path/$app/
mkdir $path
path=$path/$exp_type
mkdir $path
mkdir $path/$design

cd $path/../../scripts
srcfile=tune${app}.py
cp ./adddeps.py my_hosts worker.exe master.exe $path/$design
spacePath=$path/$design
sed -e "s/BENCH_HOLDER/$design/g" -e "s/EXPTYPE/$exp_type/g" -e "s:PATH_HOLDER:$spacePath:g" -e "s:VPR_PATH:$vprpath:g" ./$srcfile > $path/$design/$srcfile


cd $path/$design
rm -r opentuner.db
rm log
mpirun -np 1 ./master.exe -$app : -np 8 --hostfile my_hosts ./worker.exe -design $design -path $spacePath --parallelism=1  >log 

cd $path/../../scripts





