#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "./runone.sh <design> <tune_default_cst 0|1>"
   exit
fi

design=$1
tunecst=$2

mydefaultcst=20.0
maxcst=0

if [ "$design" = "eric" ]; then
  mydefaultcst=2.6
  maxcst=0.8
fi
if [ "$design" = "encrypt" ]; then
  mydefaultcst=2.5
  maxcst=0.3
fi
if [ "$design" = "robert" ]; then
  mydefaultcst=2
  maxcst=0.6
fi
if [ "$design" = "hydra" ]; then
  mydefaultcst=6.55
  maxcst=0.6
fi
if [ "$design" = "crun" ]; then
  mydefaultcst=4.3
  maxcst=0.8
fi
if [ "$design" = "jwrap" ]; then
  mydefaultcst=2.26
  maxcst=1.745
fi

if [ "$design" = "fusion" ]; then
  mydefaultcst=3.2
  maxcst=0.48
fi

if [ "$design" = "mem" ]; then
  mydefaultcst=3
  maxcst=0.4
fi

if [ "$design" = "demod" ]; then
  mydefaultcst=3.7
  maxcst=0.6
fi

if [ "$design" = "g975" ]; then
  mydefaultcst=2
  maxcst=0.4
fi

if [ "$design" = "ethernet" ]; then
  mydefaultcst=2.55
  maxcst=0.84
fi

if [ "$design" = "dsp" ]; then
  mydefaultcst=5.8
  maxcst=1
fi


app=vivado
exp_type=daTuner

path=/home/xuchang/nas/project/daTuner/evaluation/
designpath=/home/xuchang/nas/project/daTuner/evaluation/vivado_design/

path=path/$app/
mkdir $path
path=$path/$exp_type
mkdir $path
mkdir $path/$design

cd $path/../../scripts
srcfile=tune${app}.py
cp ./adddeps.py my_hosts worker.exe master.exe $path/$design
spacePath=$path/$design
sed -e "s/mBENCH_HOLDER/$design/g" -e "s/mEXPTYPE/$exp_type/g" -e "s:mPATH_HOLDER:$spacePath:g" -e "s:mDESIGN_PATH:$designpath:g" ./tunevivado.py > $path/$design/tunevivado.py

cd $path/$design
rm -r opentuner.db
rm log
#if don't want to tunecst just set --tunecst=0 for worker
mpirun -np 1 ./master.exe -$app -tunecst $mydefaultcst $maxcst : -np 8 --hostfile my_hosts ./worker.exe -design $design -path $spacePath --parallelism=1 --defaultcst=$mydefaultcst --tunecst=0 >log 

cd $path/../../scripts




