#!/usr/bin/env python
import sys
sys.path.append("/home/sx233/datuner/releases/Linux_x86_64/scripts")
import adddeps
import os
import math
import os.path
import opentuner
import numpy as np
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
#from pylab import *
import scipy as sci
import scipy.signal as signal
from scipy.signal import remez
import fpfunctions

# set the sample frequency to be 8000Hz, band stop = 0.2 * 8000 = 1600 Hz
# considering the phase shifting of waveform, we use mse of fft as indicator
# data type to be tuned: coeef * 5
def main(rank, para):
  Fs=8000
  Ts=1.0/Fs
  Ns=512
  t=np.arange(0,Ts*(Ns-1),Ts)
  noise_amp = 5.0
  pi = 3.1415926535897932
  f = [100, 800, 2800, 3200]
  f1 = f[0]
  f2 = f[1]
  f3 = f[2]
  f4 = f[3]
  x1=np.sin(2*np.pi*f1*t)
  x2=np.sin(2*np.pi*f2*t)
  x3=np.sin(2*np.pi*f3*t)
  x4=np.sin(2*np.pi*f4*t)
  x=x1+x2+x3+x4
  xo=x1+x2
  

  numtaps = 21
  bands = [0, 0.2, 0.3, 0.5]
  desired_gain = [1.0, 0.0]
  
# fixed-point conversion of input and coeff
  for i in range(len(t)):
    x[i] = fpfunctions.RealRESIZE(x[i], [int(para[0]), int(para[1]), "s"], 'ClpRnd_NoWarn')    
  numtaps = int(fpfunctions.RealRESIZE(numtaps, [int(para[2]), 0, "s"], 'ClpRnd_NoWarn'))
  for i in range(len(bands)):
    bands[i] = fpfunctions.RealRESIZE(bands[i], [int(para[3]), int(para[4]), "s"], 'ClpRnd_NoWarn')
  for i in range(len(desired_gain)):
    desired_gain[i] = fpfunctions.RealRESIZE(desired_gain[i], [int(para[5]), int(para[6]), "s"], 'ClpRnd_NoWarn')

  for i in range(len(bands)-1):
    if bands[i] >= bands[i+1] : bands[i] += 0.001
    

#  sys.exit(1)
# design of the fir filter, bandstop = 0.2 * 8000 = 1600 Hz
  try:
    lpf = remez(numtaps, bands, desired_gain)
    from scipy.signal import freqz
    from scipy.signal import lfilter
    xout = lfilter(lpf, 1, x)
  
    w, h = freqz(lpf)
    hdb = 20 * np.log10(np.abs(h))
    hphs = np.unwrap(np.arctan2(np.imag(h),np.real(h)))
    Npts = 200
  
    fig = plt.figure(1)
    fig.subplots_adjust(wspace=0.9,hspace=0.9)
    ax = fig.add_subplot(311)
    ax.set_title('input signal')
    ax.plot(t[1:Npts],x[1:Npts])    # just plot part of the signal
    ax = fig.add_subplot(312)
    ax.set_title('expected signal')
    ax.plot(t[1:Npts],xo[1:Npts])
    ax = fig.add_subplot(313)
    ax.set_title('filtered signal')
    ax.plot(t[1:Npts],xout[1:Npts])
    fig.savefig('result.png')
  
    fig2=plt.figure(2)
    fig2.subplots_adjust(wspace=0.9,hspace=0.9)    
    ax2 = fig2.add_subplot(211)
    ax2.set_title('frequency response')
    ax2.plot(w/max(w),hdb)
    ax2 = fig2.add_subplot(212)
    ax2.set_title('phase response')
    ax2.plot(w/max(w),hphs)
    fig2.savefig('response.png')

# to compute the error with the expected result 
# objective function: to calculate the MSE of fft as the indicator

# one way to fir and draw frequency response
#  b=np.array([0.0051,0,-0.0294,0,0.1107,0,-0.2193,0,0.271,0,-  0.2193,0,0.1107,0,-0.0294,0,0.0051])
#  y=signal.convolve(x,b)
    fftmag1=np.abs(np.fft.fft(x,Ns))
    fftmagh1=fftmag1[1:len(fftmag1)/2]
    f1=np.arange(1,len(fftmagh1)+1)*Fs/Ns
    fftmag2=np.abs(np.fft.fft(xo,Ns))
    fftmagh2=fftmag2[1:len(fftmag2)/2]
    f2=np.arange(1,len(fftmagh2)+1)*Fs/Ns
    fftmag3=np.abs(np.fft.fft(xout,Ns))
    fftmagh3=fftmag3[1:len(fftmag3)/2]
    f3=np.arange(1,len(fftmagh3)+1)*Fs/Ns
  
    fig3=plt.figure(3)
    fig3.subplots_adjust(wspace=0.9,hspace=0.9)
    ax3 = fig3.add_subplot(312)
    ax3.set_title('expected spectrum')
    ax3.plot(f2,fftmagh2)
    ax3 = fig3.add_subplot(313)
    ax3.set_title('filtered spectrum')
    ax3.plot(f3,fftmagh3)
    ax3 = fig3.add_subplot(311)
    ax3.set_title('original spectrum')
    ax3.plot(f1,fftmagh1)
    fig3.savefig('fft.png')
    v = map(lambda x,y:x - y,fftmagh2,fftmagh3)
    mse = 0
    for i in range(len(v)):
      mse += v[i]*v[i]/float(len(v))
  except:
    mse = 10000

  print mse
  filename = "mse" + str(rank) + ".txt"
  f = open(filename, 'w')
  f.write(str(mse))
  f.close()

def another():
# plot the figure of signals
  fig = plt.figure(1)
  ax = fig.add_subplot(311)
  ax.set_title('input signal')
  ax.plot(t[1:Npts],x[1:Npts])    # just plot part of the signal
  ax = fig.add_subplot(312)
  ax.set_title('expected signal')
  ax.plot(t[1:Npts],xo[1:Npts])
  ax = fig.add_subplot(313)
  ax.set_title('filtered signal')
  ax.plot(t[1:Npts],y[1:Npts])
  fig.savefig('pic1.png')
 
# plot the mag & phase response of the LPF
  w,h = signal.freqz(b,1)
  hdb = 20 * np.log10(np.abs(h))
  hphs = np.unwrap(np.arctan2(np.imag(h),np.real(h)))
  fig2=plt.figure(2)
  ax2 = fig2.add_subplot(211)
  ax2.set_title('frequency response')
  ax2.plot(w/max(w),hdb)
  ax2 = fig2.add_subplot(212)
  ax2.set_title('phase response')
  ax2.plot(w/max(w),hphs)
  fig2.savefig('pic2.png')

if __name__ == '__main__':
    rank = sys.argv[1]
    para = []
    for index in range(2,len(sys.argv)):
       temp = sys.argv[index]
       para.append(temp)
    main(rank, para)
