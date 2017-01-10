#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "./runall.sh <exp-type>"
  exit
fi

exp_type=$1

for ckt in `cat bench.txt` ;
do
  ./runone.sh $ckt 100 $exp_type 
done
