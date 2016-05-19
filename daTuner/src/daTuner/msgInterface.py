import sys
from mpi4py import MPI


class msgPassing(object):
  def __init__(self,comm):
    self.comm = comm
  def sendMsg(self,data,flag):
    rank = self.comm.Get_rank()
    for ix in range(self.comm.Get_size()):
      if ix != rank:
        req = self.comm.isend(data,dest=ix,tag=flag)
        req.wait()
        #print 'send '+str(rank)+'->'+str(ix), data
  def recvMsg(self,buf,flag):
    data = None
    status = MPI.Status()
    rank = self.comm.Get_rank()
    while self.comm.iprobe(source = MPI.ANY_SOURCE, tag = flag):
      data = self.comm.recv(source=MPI.ANY_SOURCE,tag=flag,status=status)
      #print 'recv '+str(rank)+'<-'+str(status.Get_source()), data
      buf.append(data)




