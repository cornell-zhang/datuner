AUTOMAKE_OPTIONS=foreign
INCLUDES= -I /home/xuchang/nas/opt/Python2.7.12/include/python2.7/ -I /home/xuchang/nas/opt/mpich3.2/include/
LDFLAGS=-lm -lpthread -ldl -lutil -lpython2.7 -L/home/xuchang/nas/opt/mpich3.2/lib/ -lmpi

bin_PROGRAMS=master worker
master_SOURCES=controler.cpp bandit.cpp space_divider.cpp space_divider4Vivado.cpp space_divider4VPR.cpp msg_passing.cpp space_partition.cpp
worker_SOURCES=worker.cpp autoTuner.cpp msg_passing.cpp


