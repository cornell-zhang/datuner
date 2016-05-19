**DATuner**

DATuner is a bandit-based parallel autotuner targets EDA problems. We build DATuner based on an open sourced OpenTuner project.(https://github.com/jansel/opentuner)

We make the following changes:

1. We support parallel searching across multi-machines with message passing interface (MPI).

2. We integrate machine learning algorithms as additional arms.

3. We leverage machine learning algorithms to do quick local search.

**Development installation**


*Requirements of OpenTuner:* 

argparse>=1.2.1

fn>=0.2.12

numpy>=1.8.0

pysqlite>=2.6.3

SQLAlchemy>=0.8.2

*Additional DATuner requirements:*

mpi4py # this package provides Python buildings for MPI standard. Download from http://pythonhosted.org/mpi4py/

MPI Softwares e.g., Open MPI(https://www.open-mpi.org/) or MPICH(https://www.mpich.org/)

**Introduction to DATuner source code**
/daTuner/src

*Source code from OpenTuner:*

resultsdb #define database

measurement #manipulate user supported configuration

search #a bunch of search techniques 

utils 

*Source code of DATuner:*
daTuner

I modify part of OpenTuner source code. To check the details of modification, please refer to CHNAGES


**Installation**

Please refer https://github.com/jansel/opentuner to install OpenTuner first. Then replace our source code with OpenTuner source code. 

% cd daTuner/src

% cp * path-to-OpenTuner source code

**How to use DATuner**

DATuner can support many EDA problems. We take VTR (https://github.com/verilog-to-routing/vtr-verilog-to-routing) parameter tuning as an example. 

First, before we talk about specific details, here are some high level instructions of running DATuner. Users should have the following files to run DATuner.

1. runTuner.py. This works like a wrapper file. We make some settings here. 
In setDefaultcfg function, users can specify the default configuration.
msgholder tells whether users want message passing or not.
raw2learn function, users can specify how to translate the string type options to integer for machine learning.
learn2raw function, users specify how to translate the integer back to string type. 

2. tuneVPR.py. In this file, users should implement two functions: manipulator and run. In manipulator function, users show how to manipulate their parameters. And in run function, users show how to run their application.

3. runone.sh. is a bash script to make some preparations. The usage of runone.sh is:

% ./runone.sh <tech><design><type multiCPU|thread><procnum><test-limit><nomsg|msg>

tech: which technique to use. Default OpenTuner technique is AUCBanditMetaTechniqueA.

design: which design to run. VTR has published several benchmarks. For details, please refer http://www.eecg.utoronto.ca/~vaughn/papers/trets2014_vtr.pdf

type: either set as multiCPU(run in parallel) or thread(run in sequential)

procnum: how many processes to use. Now we only support run one process on each machine due to the limitation of database.

test-limit: The max number of iterations to search

nomsg|msg: either set as msg(with message sharing) or nomsg(without message sharing)

Here are some examples to show how to use DATuners:
/daTuner/apps/vtr_release is the source code download from VTR project

/daTuner/apps/vtr contains examples of using DATuner

/daTuner/apps/vtr/parallel shows how to run DATuner in parallel

% ./runone.sh AUCBanditMetaTechniqueA diffeq1 multiCPU 8 100 msg

/daTuner/apps/vtr/ml-arm shows how to run machine learning technique

% ./runone.sh AUCMachineLearn diffeq1 multiCPU 8 100 msg

/daTuner/apps/vtr/ml-local shows how to use machine learning techniques to do local search

% ./runone.sh AUCMachineLearn diffeq1 multiCPU 8 100 msg

 
**Visualization**

/daTuner/visualization/vtr-data I use matplotlib to do visualization.
This folder contains some graphs I show in ICCAD submission.