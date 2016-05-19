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
from random import randint
import numpy as np
from scipy import stats
from sklearn import cross_validation
from sklearn.semi_supervised import label_propagation
from sklearn.metrics import classification_report, confusion_matrix
import learnmethod
from learnmethod import learnBase
from sklearn.naive_bayes import GaussianNB

class Bayesian(technique.SequentialSearchTechnique,learnmethod.learnBase):
  def __init__(self):
    technique.SequentialSearchTechnique.__init__(self)
    learnmethod.learnBase.__init__(self)



  def learn(self,num,new_cfg):
    clf = GaussianNB()
    self.querydb(self.driver,self.manipulator)
    assert self.Xtrain is not None
    assert self.ytrain is not None

    #print "debug training data"
    #print self.Xtrain
    #print self.ytrain
    #print "finish print train data"

    ##check accuracy
    tmpXtrain, tmpXtest, tmpytrain, tmpytest = cross_validation.train_test_split(self.Xtrain,self.ytrain,test_size=0.4,random_state = 0)
    clf.fit(tmpXtrain,tmpytrain)
    predictRes = clf.predict(tmpXtest)
    cm = confusion_matrix(tmpytest,predictRes)
    print cm
    print classification_report(tmpytest,predictRes)
    ##

    clf.fit(self.Xtrain,self.ytrain)
    self.neighbour(self.driver.best_result.configuration.data,self.manipulator)
    assert self.Xsample is not None
    predicted_proba = clf.predict_proba(self.Xsample)

    #print "debug predicting"
    #print predicted_proba

    tmpbuf = []
    for ix in range(len(predicted_proba)):
      tmpbuf.append((self.Xsample[ix],1-predicted_proba[ix][0]))
    tmpbuf.sort(key=lambda tup:tup[1], reverse=True)

    print "new cfg"
    for ix in range(num):
      cfg = self.manipulator.copy(self.defaultcfg)
      index = 0
      for param in self.manipulator.parameters(cfg):
        param.set_value(cfg,self.learn2raw(param.name,tmpbuf[ix][0][index]))
        #param.set_value(cfg,tmpbuf[ix][0][index])
        index += 1
      print cfg
      cfg = self.driver.get_configuration(cfg)
      new_cfg.append(cfg)

  def main_generator(self):
    print "check defaultcfg"
    print self.defaultcfg

    #eval defaultcfg
    yield self.gen_default_cfg(self.driver)
    defres = self.driver.session.query(Result).filter(Result.configuration == self.gen_default_cfg(self.driver)).first()
    self.baseline = float(defres.time)
    print "default result"
    print self.baseline

    randomnum = 20
    minisize = 30
    num = 1
    while True:
      randomnum += 1
      print "db size: "+str(self.querydbSize(self.driver))
      if float(self.querydbSize(self.driver)) < minisize:
        for ix in range(num):
          cfg = self.manipulator.copy(self.defaultcfg)
          for param in self.manipulator.parameters(cfg):
            param.set_value(cfg,self.genrandomVal(param,randomnum))
          cfg = self.driver.get_configuration(cfg)
          self.yield_nonblocking(cfg)
        yield None
      else:
        print "learning start"
        new_cfg = []
        self.learn(num,new_cfg)
        for ix in new_cfg:
          self.yield_nonblocking(ix)
        yield None

technique.register(Bayesian())
