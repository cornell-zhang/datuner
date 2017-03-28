#!/bin/bash

###################################
# This script runs DATuner with easy mode 
# Usage:
# run_DATuner_easy.sh <Vivado|Quartus|VTR> <design> <objective> [OPTIONS]
# 
# Parameters:
#  Vivado|Quartus|VTR: Specify which EDA flow uses
#  design: The design to tune
#  objective: Support delay\area\wirelength
# 
# Options:
#  -process_num <number>: how many processes used
#  -temp_dir <dir>: Directory used for all temporary files
##################################

##############Arguments###########
SHORT=t:d:o:n:p:
LONG=tool:,design:,obj:,proc_num:,temp_dir:
PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")

if [ "$#" -le 1 ]; then
  echo "./run_DATuner_easy.sh -t <vivado|Quartus|vpr> -d <design> -o <objective>"
  exit
fi
####Need to modify#######
TOOLPATH=/home/xuchang/nas/project/daTuner/experiment/vtr_release/vtr_flow/
TOOL=""
DESIGN=""
OBJ=""
PROC_NUM=8

eval set -- "$PARSED"
while true; do
  case "$1" in
    -t|--tool)
      TOOL="$2"
      shift 2
      echo $TOOL
      ;;
    -d|--design)
      DESIGN="$2"
      shift 2
      echo $DESIGN
      ;;
    -o|--obj)
      OBJ="$2"
      shift 2
      ;;
    -n|--proc_num)
      PROC_NUM="$2"
      shift 2
      ;;
    -p|--temp_dir)
      TEMP_DIR="$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Programming error"
      exit 3
      ;;
  esac
done
CURRENT_PATH=$(pwd)
TEMP_DIR=$CURRENT_PATH/../experiment/$TOOL/$DESIGN

###############Preparation##############
BIN_DIR=$CURRENT_PATH/../bin/
SCRIPT_DIR=$CURRENT_PATH/
mkdir $CURRENT_PATH/../experiment
mkdir $CURRENT_PATH/../experiment/$TOOL
mkdir $CURRENT_PATH/../experiment/$TOOL/$DESIGN
#cp ./adddeps.py my_hosts $CURRENT_PATH/../bin/worker $CURRENT_PATH/../bin/master $TEMP_DIR
SRC_FILE=$CURRENT_PATH/eda_flows/tune${TOOL}.py
sed -e "s/BENCH_HOLDER/$DESIGN/g" -e "s:PATH_HOLDER:$TEMP_DIR:g" -e "s:TOOL_PATH:$TOOLPATH:g" $SRC_FILE > $TEMP_DIR/tune${TOOL}.py

##############Run DATuner################
cd $TEMP_DIR 
rm -r opentuner.db
rm log
mpirun -np 1 $BIN_DIR/master -$TOOL : -np $PROC_NUM --hostfile $SCRIPT_DIR/my_hosts $BIN_DIR/worker -design $DESIGN -path $TEMP_DIR --parallelism=1  >log 

##############Visualization##############



