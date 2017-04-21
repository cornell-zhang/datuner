#!/bin/bash

###################################
# This script runs DATuner with easy mode 
# Usage:
# run_DATuner_easy.sh <Vivado|Quartus|VTR> <design> <objective> <temp_dir> [OPTIONS]
# 
# Parameters:
#  Vivado|Quartus|VTR: Specify which EDA flow uses
#  design: The design to tune
#  objective: Support delay\area\wirelength
#  temp_dir <dir>: Directory to save experimental results
# 
# Options:
#  -process_num <number>: how many processes used
##################################

##############Arguments###########
SHORT=t:d:o:n:p:
LONG=tool:,design:,obj:,proc_num:,temp_dir:
PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")

if [ "$#" -le 1 ]; then
  echo "./run_DATuner_easy.sh -t <vivado|Quartus|vpr> -d <design> -o <objective> -p <dir>"
  exit
fi

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
TEMP_DIR=$TEMP_DIR/$TOOL/$DESIGN
mkdir -p $TEMP_DIR/$TOOL
mkdir -p $TEMP_DIR/$TOOL/$DESIGN
RELEASE_PATH=$CURRENT_PATH
##############TODO:remove hard code##########
TOOLPATH=/home/xuchang/nas/project/daTuner/myrelease/build/pkgs/vtr/vtr_release/vtr_flow/

###############Preparation##############
BIN_DIR=$RELEASE_PATH/bin/
SCRIPT_DIR=$RELEASE_PATH/scripts
SRC_FILE=$SCRIPT_DIR/eda_flows/tune${TOOL}.py
sed -e "s/BENCH_HOLDER/$DESIGN/g" -e "s:PATH_HOLDER:$TEMP_DIR:g" -e "s:TOOL_PATH:$TOOLPATH:g" $SRC_FILE > $TEMP_DIR/tune${TOOL}.py

##############Run DATuner################
cd $TEMP_DIR 
rm -r -f opentuner.db
rm -f log
mpirun -np 1 $BIN_DIR/DATuner_master -$TOOL : -np $PROC_NUM --hostfile $SCRIPT_DIR/my_hosts $BIN_DIR/DATuner_worker -design $DESIGN -path $TEMP_DIR --parallelism=1  >log 

##############Visualization##############



