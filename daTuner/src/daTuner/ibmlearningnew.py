from opentuner.search import technique
from opentuner.resultsdb.models import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship, backref
from sqlalchemy import (Column, Integer, String, DateTime, Boolean, Enum,Float, PickleType, ForeignKey, Text, func, Index)
import sqlalchemy
from operator import itemgetter
import itertools
import random
from opentuner.daTuner.defaultcfg import DefaultCFG


def check_diff(manipulator,cfg1,cfg2):
  """
  check whether two cfgs are same
  """
  for param in manipulator.parameters(cfg1):
    for tparam in manipulator.parameters(cfg2):
      if param.name == tparam.name:
        if param.get_value(cfg1) != tparam.get_value(cfg2):
          return False
  return True


def gen_cfg(index,survivor,manipulator,defaultcfg,driver):
  """
  generate cfg for sensitive test
  """
  if len(survivor) == 0:
    return None
  cfg = manipulator.copy(defaultcfg)
  for ix in range(len(index)):
    for param in manipulator.parameters(survivor[index[ix]].data):
      for tparam in manipulator.parameters(cfg):
        if param.name == tparam.name:
          if param.get_value(survivor[index[ix]].data) != tparam.get_value(cfg):
            tparam.set_value(cfg,param.get_value(survivor[index[ix]].data))
  cfg = driver.get_configuration(cfg)
  return cfg

def get_param(manipulator,defaultcfg,cfg):
  """
  return which parameter is modified
  """
  for param in manipulator.parameters(defaultcfg):
    for tparam in manipulator.parameters(cfg):
      if param.name == tparam.name:
        if param.get_value(defaultcfg) != tparam.get_value(cfg):
          return param.name

def cost_function(List):
    Combined_sum=[]
    Combined_sum=List
    k=[]
    print "Combined List"
    for i in range(len(Combined_sum)):
        print Combined_sum[i][0].data
        print Combined_sum[i][1]
    ##########################Have to change#########################
    for i in range(len(Combined_sum)):
        k.append(Combined_sum[i][1])
        avg=0.0
        for j in xrange(len(k)):
            avg += k[j]
        avg = avg /(len(k))
        Combined_sum[i] = Combined_sum[i] + (avg,)
        print '\n'
        #print Combined_sum[i][-1]


    Combined_sum.sort(key=lambda tup: tup[-1], reverse=True)    #sorted(Combined_sum,key=lambda x:x[-1])
    print '\n'
    print "Cost function sorted list"
    for i in range(len(Combined_sum)):
        print Combined_sum[i][0].data
        print Combined_sum[i][1]


class Learning_Search(technique.SequentialSearchTechnique,DefaultCFG):
  def __init__(self):
    technique.SequentialSearchTechnique.__init__(self)
    DefaultCFG.__init__(self)
#    #self.defaultcfg = {'resyn':'off','resyn2':'off','resyn3':'off',
#        'alpha_clustering':0.75,'beta_clustering':0.9,
#        'allow_unrelated_clustering':'on','connection_driven_clustering':'on',
#        'alpha_t':0.8,'seed':1,'inner_num':10,'timing_tradeoff':0.5,
#        'inner_loop_recompute_divider':0,'td_place_exp_first':1,'td_place_exp_last':8,
#        'max_router_iterations':50,'initial_pres_fac':0.5,'pres_fac_mult':1.3,'acc_fac':1,
#        'bb_factor':3,'base_cost_type':'delay_normalized','astar_fac':1.2,
#        'max_criticality':0.99,'criticality_exp':1}
#
  def main_generator(self):

    objective   = self.objective
    driver      = self.driver
    manipulator = self.manipulator

    # start at a default cfg
    center = manipulator.copy(self.defaultcfg)
    print center
    center = driver.get_configuration(center)
    initPoints = list()
#    yield center
#    initPoints.append(center)
#    res = self.driver.session.query(Result).filter(Result.configuration == center).first()
#    default_obj = res.time
#    print "default value"
#    print default_obj

    # sensitivity check
    for param in manipulator.parameters(center.data):
      assert param.datatype == "INT" or param.datatype == "FLOAT" or param.datatype == "ENUM"
      if param.datatype == "ENUM":
        for ix in range(len(param.options)):
          cfg = manipulator.copy(center.data)
          param.set_value(cfg,param.options[ix])
          if check_diff(manipulator,center.data,cfg) == False:
            cfg = driver.get_configuration(cfg)
            self.yield_nonblocking(cfg)
            initPoints.append(cfg)
      if param.datatype == "FLOAT":
        tmpbuf = [param.min_value+random.random()*(param.max_value-param.min_value) for ix in range(5)]
        for ix in range(len(tmpbuf)):
          cfg = manipulator.copy(center.data)
          param.set_value(cfg,tmpbuf[ix])
          if check_diff(manipulator,center.data,cfg) == False:
            cfg = driver.get_configuration(cfg)
            self.yield_nonblocking(cfg)
            initPoints.append(cfg)
    yield None

    print "finish sensitive test"
    #sort by result
    initPoints.sort(cmp=objective.compare)
    sortRes = []

    newPoints = []
    print "debug initPoints"
    for ix in range(len(initPoints)):
      print initPoints[ix].data
      #access to db to query result
      res = self.driver.session.query(Result).filter(Result.configuration == initPoints[ix]).first()
      print res.configuration.data
      print res.time
      sortRes.append( (res.configuration, res.time) )
    sorted(sortRes,key=itemgetter(1))

    # survivor set
    check_exist = list()
    survivor = []
    print "debug check sorted result"
    for ix in range(len(sortRes)):
      print sortRes[ix][0].data
      print sortRes[ix][1]
      if ix < 15:
        if check_exist.count(get_param(manipulator, self.defaultcfg, sortRes[ix][0].data)) == 0:
          check_exist.append(get_param(manipulator, self.defaultcfg, sortRes[ix][0].data))
          survivor.append(sortRes[ix][0])
    print "check survivor: length"
    print len(survivor)
    for tcfg in survivor:
      print tcfg.data
      print get_param(manipulator, self.defaultcfg, tcfg.data)

    # iterative combinations
    for ix in range(3):
      combn = ix + 2
      for iy in itertools.combinations(list(range(0,len(survivor))),combn):
        cfg = gen_cfg(iy,survivor,self.manipulator,self.defaultcfg, self.driver)
        if cfg is None:
          continue
        self.yield_nonblocking(cfg)
        newPoints.append(cfg)
    yield None

		List1=[]
    List2=[]
    for ix in range(9):
      comb=ix+2
      print comb
      if(comb==2):
        List1=compute_generations(s1,comb)
        s1=list(List1)
      if(comb==3):
        List2=compute_generations(s1,comb)
        s1=list(List2)
    combined_List=[]
    combined_List=List1+List2
    """sec_iteration_scenarios=[]
    for i in range(len(combined_List)):
      print combined_List[i][0].data
      print combined_List[i][1]
      if(combined_List[ix][1]<sorted_Result[ix][1]):
        if(check_if_exist.count(get_param(manipulator,combined_List[ix][0].data))==0):
          check_if_exist.append(get_param(manipulator,combined_List[ix][0].data))
          sec_iteration_scenarios.append(combined_List[ix][0].data)"""

    cost_function(Combined_list)



    eval_tuples = []
    for res in self.driver.session.query(Result).all():
      eval_tuples.append( (res.configuration, res.time) )
    sorted(eval_tuples, key=itemgetter(1))
    for ix in range(len(eval_tuples)):
      print eval_tuples[ix][0].data
      print eval_tuples[ix][1]







technique.register(Learning_Search())




