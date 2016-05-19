import sys
from mpi4py import MPI
import time
import argparse
import os
import opentuner
import tuneVPR
from tuneVPR import VPRTuner
from opentuner.daTuner.msgInterface import msgPassing
from opentuner.daTuner.learnmethod import learnBase
from opentuner.daTuner.defaultcfg import DefaultCFG

def setDefaultcfg():
  """
  set the default configuration
  """
  defaultcfg = {'resyn':'off','resyn2':'off','resyn3':'off',
    'alpha_clustering':0.75,'beta_clustering':0.9,
    'allow_unrelated_clustering':'on','connection_driven_clustering':'on',
    'alpha_t':0.8,'seed':1,'inner_num':10,'timing_tradeoff':0.5,
    'inner_loop_recompute_divider':0,'td_place_exp_first':1,'td_place_exp_last':8,
    'max_router_iterations':50,'initial_pres_fac':0.5,'pres_fac_mult':1.3,'acc_fac':1,
    'bb_factor':3,'base_cost_type':'delay_normalized','astar_fac':1.2,
    'max_criticality':0.99,'criticality_exp':1}
  return defaultcfg


#argparser = argparse.ArgumentParser(add_help=False)
#argparser = opentuner.default_argparser()
#argparser.add_argument('--parallel',action='store_true',
#    help="run in parallel with message passing")
#argparser.add_argument('--parallel-no-msg',action='store_true',
#    help="run in parallel without message passing")


if __name__ == '__main__':
  argparser = opentuner.default_argparser()
  args = argparser.parse_args()

  msgholder = "msg"


  comm = MPI.COMM_WORLD
  rank = comm.Get_rank()
  name=MPI.Get_processor_name()
  msg = msgPassing(comm)
  size = comm.Get_size()

  DefaultCFG.setDefaultcfg(setDefaultcfg())
  if msgholder == "msg" and size > 1:
    from opentuner.search.driver import SearchDriver
    SearchDriver.setmsg(msg)
  VPRTuner.main(args,msg)

