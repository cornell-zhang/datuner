from opentuner.search import technique
from opentuner.resultsdb.models import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship, backref
from sqlalchemy import (Column, Integer, String, DateTime, Boolean, Enum,Float,       PickleType, ForeignKey, Text, func, Index)
import sqlalchemy
from operator import itemgetter
import itertools
import random
from random import randint
import numpy as np
from scipy import stats
from sklearn.semi_supervised import label_propagation
from sklearn.metrics import classification_report, confusion_matrix
from sklearn.naive_bayes import GaussianNB
import copy
from opentuner.daTuner.defaultcfg import DefaultCFG

class learnBase(DefaultCFG):
  def __init__(self):
    self.Xtrain = None
    self.ytrain = None
    self.Xsample = None
    self.baseline = -1
    self.step = 5 #define neighbourhood
    self.neighbourSize = 500
    #assert DefaultCFG().defaultcfg is not None
    #self.defaultcfg = copy.deepcopy(DefaultCFG().defaultcfg)
    raw2learndict = None
    learn2rawdict = None

  def setDefaultcfg(self):
    """
    set default configuration
    """
    assert DefaultCFG.defaultcfg is not None
    print "debug default"
    print DefaultCFG.defaultcfg
    self.defaultcfg = copy.deepcopy(DefaultCFG.defaultcfg)
  @classmethod
  def raw2learndict(cls,dicta):
    """
    convert raw data to learn data
    """
    cls.raw2learndict = copy.deepcopy(dicta)
    #print cls.raw2learndict
  @classmethod
  def learn2rawdict(cls,dicta):
    """
    convert learn data to raw data
    """
    cls.learn2rawdict = copy.deepcopy(dicta)
    #print cls.learn2rawdict

  def gen_default_cfg(self,driver):
    return driver.get_configuration(self.defaultcfg)

  def querydbSize(self,driver):
    dbdata = driver.session.query(DesiredResult).all()
    dbdata = list(set(dbdata))
    ix = 0
    for res in dbdata:
      if res.state == 'COMPLETE':
        ix += 1
    return ix

  def raw2learn(self,rawvalue, paramname, type):
    if type != "ENUM":
      return rawvalue
    name=paramname+str(rawvalue)
    if name in self.raw2learndict:
      return self.raw2learndict[name]
    else:
      return rawvalue


  def learn2raw(self,paramname,learnvalue):
    name=paramname+str(learnvalue)
    assert self.learn2rawdict is not None
    if name in self.learn2rawdict:
      return self.learn2rawdict[name]
    else:
      return learnvalue


  def querydb(self,driver,manipulator):
    dbdata = driver.session.query(DesiredResult).all()
    dbdata = list(set(dbdata))
    Xtrain = []
    ytrain = []
    for res in dbdata:
      if res.state == 'COMPLETE':
        tmp = []
        for param in manipulator.parameters(self.defaultcfg):
          for tparam in manipulator.parameters(res.configuration.data):
            if param.name == tparam.name:
              tmp.append(self.raw2learn(tparam.get_value(res.configuration.data),param.name,param.datatype))
        Xtrain.append(tmp)
        assert self.baseline != -1
        if float(res.result.time) < self.baseline:
          ytrain.append(1)
        else:
          ytrain.append(0)
    assert len(Xtrain) == len(ytrain)
    if len(Xtrain) > 0:
      self.Xtrain = np.array(Xtrain)
      self.ytrain = np.array(ytrain)


  def genrandomVal(self,param,randomnum=20):
    #random.seed(a=randomnum)
    #print "randomnum "+str(randomnum)
    assert param.datatype == "INT" or param.datatype == "FLOAT" or param.datatype == "ENUM"
    if param.datatype == "FLOAT":
      return float(param.min_value + random.random()*(param.max_value-param.min_value))
    if param.datatype == "INT":
      return random.randrange(param.min_value,param.max_value,1)
    if param.datatype == "ENUM":
      rand = randint(0,len(param.options)-1)
      return param.options[rand]

  def neighbour(self,tcfg,manipulator):
    #random.seed(a = 20)
    Xsample = []
    cfg = manipulator.copy(tcfg)
    for ix in range(self.neighbourSize):
      tmp = []
      paramBuf = []
      for iy in range(self.step):
        rand = randint(0,len(manipulator.parameters(cfg))-1)
        paramBuf.append(manipulator.parameters(cfg)[rand])
      assert len(paramBuf) == self.step
      for param in paramBuf:
        #rand = randint(0,len(param.options)-1)
        param.set_value(cfg,self.genrandomVal(param))
      for param in manipulator.parameters(self.defaultcfg):
        for tparam in manipulator.parameters(cfg):
          if param.name == tparam.name:
            tmp.append(self.raw2learn(param.get_value(cfg),param.name, param.datatype))
#            if param.get_value(cfg) == 'on':
#              tmp.append(0)
#            elif param.get_value(cfg) == 'off':
#              tmp.append(1)
#            elif param.get_value(cfg) == 'demand_only':
#              tmp.append(0)
#            elif param.get_value(cfg) == 'delay_normalized':
#              tmp.append(1)
#            else:
#              tmp.append(param.get_value(cfg))
      Xsample.append(tmp)
    self.Xsample = np.array(Xsample)
    #print "debug neighbourhood"
    #for ix in Xsample:
    #  print ix
  def augmentDataSet(self):
    ytmp = [-1 for ix in range(len(self.Xsample))]
    ysample = np.array(ytmp)
    print len(self.Xtrain),len(self.ytrain),len(self.Xsample),len(ysample)
    self.Xtrain = np.concatenate((self.Xtrain,self.Xsample))
    self.ytrain = np.concatenate((self.ytrain,ysample))
    print len(self.Xtrain),len(self.ytrain)


