#!/bin/bash

###################################
# This script runs DATuner with advance mode 
# Usage:
# run_DATuner_advance.sh -space <space_definition> -pycode <python_code> -design <design_name>  [OPTIONS]
# 
# Parameters:
#  space: space definition
#  pycode: python code for tuning
#  design: the design to tune
# 
# Options:
#  -tool_name <name>: user's program's name
#  -process_num <number>: how many processes used
#  -temp_dir <dir>: Directory used for all temporary files
##################################

##############Arguments###########
SHORT=s:c:n:p:t:d:
LONG=space:,pycode:,proc_num:,temp_dir:,tool_name:,design:
PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")

if [ "$#" -le 1 ]; then
  echo "./run_DATuner_advance.sh -s <space_definition> -c <python_code> -d <design_name>"
  exit
fi
####Need to modify#######
SPACE_FILE=""
PYCODE=""
PROC_NUM=8
DESIGN=""
TOOL_NAME="T1"

eval set -- "$PARSED"
while true; do
  case "$1" in
    -s|--space)
      SPACE_FILE="$2"
      shift 2
      ;;
    -c|--pycode)
      PYCODE="$2"
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
    -t|--tool_name)
      TOOL_NAME="$2"
      shift 2
      ;;
    -d|--design)
      DESIGN="$2"
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
TEMP_DIR=$CURRENT_PATH/../experiment/$TOOL_NAME/$DESIGN
###???how to mkdir for TEMP_DIR
###############Preparation##############
BIN_DIR=$CURRENT_PATH/../bin/
SCRIPT_DIR=$CURRENT_PATH
mkdir $CURRENT_PATH/../experiment
mkdir $CURRENT_PATH/../experiment/$TOOL_NAME
mkdir $CURRENT_PATH/../experiment/$TOOL_NAME/$DESIGN
cp $SPACE_FILE $TEMP_DIR/orgspace.txt
sed -e "s:BENCH_HOLDER:$DESIGN:g" -e "s:PATH_HOLDER:$TEMP_DIR:g" $PYCODE > $TEMP_DIR/tuneProgram.py

##############Run DATuner################
cd $TEMP_DIR 
rm -r opentuner.db
rm log
mpirun -np 1 $BIN_DIR/master -space $TEMP_DIR/orgspace.txt : -np $PROC_NUM --hostfile $SCRIPT_DIR/my_hosts $BIN_DIR/worker -design $DESIGN  -path $TEMP_DIR --parallelism=1  >log 

##############Visualization##############



