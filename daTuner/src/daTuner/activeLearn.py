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
from sklearn.semi_supervised import label_propagation
from sklearn.metrics import classification_report, confusion_matrix
import learnmethod
from learnmethod import learnBase

class ActiveLearn(technique.SequentialSearchTechnique,learnmethod.learnBase):

  def __init__(self):
    technique.SequentialSearchTechnique.__init__(self)
    learnmethod.learnBase.__init__(self)

  def learn(self,num,new_cfg):
    clf = label_propagation.LabelSpreading(gamma=0.25, max_iter=5)
    self.querydb(self.driver,self.manipulator)
    assert self.Xtrain is not None
    assert self.ytrain is not None
    self.neighbour(self.driver.best_result.configuration.data,self.manipulator)
    assert self.Xsample is not None
    self.augmentDataSet()
    clf.fit(self.Xtrain, self.ytrain)
    pred_entropies = stats.distributions.entropy(clf.label_distributions_.T)
    testLabel = np.argsort(pred_entropies)[-num:]
    predicted_labels = clf.transduction_[testLabel]
    print testLabel
    for ix in range(len(testLabel)):
      id = testLabel[ix]
      cfg = self.manipulator.copy(self.defaultcfg)
      index = 0
      for param in self.manipulator.parameters(cfg):
        param.set_value(cfg,self.learn2raw(param.name,self.Xtrain[id][index]))
        index += 1
      cfg = self.driver.get_configuration(cfg)
      new_cfg.append(cfg)
  def main_generator(self):
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
        print "random sample"

        for ix in range(num):
          cfg = self.manipulator.copy(self.defaultcfg)
          for param in self.manipulator.parameters(cfg):
            param.set_value(cfg,self.genrandomVal(param,randomnum))
          cfg = self.driver.get_configuration(cfg)
          self.yield_nonblocking(cfg)
        yield None
        #self.myrandomSample(num,self.gen_default_cfg(self.driver),self.driver,self.         manipulator)
        print "finish sampling"
      else:
        print "learning start"
        new_cfg = []
        self.learn(num,new_cfg)
        for ix in new_cfg:
          print ix.data
          self.yield_nonblocking(ix)
        yield None


technique.register(ActiveLearn())




