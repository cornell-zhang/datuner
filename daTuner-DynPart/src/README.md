controller.cpp: master process. Take care of space division, resource allocation and task distribution among workers.

worker.cpp: worker process. Recv task from controller. Call OpenTuner to execute searching.

autoTuner.cpp: call OpenTuner

bandit.cpp: UCB-1 Multi-arm bandit

msg_passing.cpp: MPI message passing

structure.h: structure used

space_divider4ISE.cpp: specify feasible space of ISE.

space_divider4VPR.cpp: specify feasible space of VPR.

space_divider4Vivado.cpp: specify feasible space of Vivado.

space_partition.cpp: dynamic space partition based on information gain


