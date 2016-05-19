import copy

class DefaultCFG(object):
  def __init__(self):
    defaultcfg = None
  @classmethod
  def setDefaultcfg(cls,cfg):
    cls.defaultcfg = copy.deepcopy(cfg)
    #print "DefaultCFG"
    #print cls.defaultcfg
