import math
import fpfunctions
import sys
#import numpy as np
import argparse
#from GlobalValue import MyGlobals
    
#parser = argparse.ArgumentParser()
#parser.add_argument('--list', type=str)
#args = parser.parse_args()

# create the dictionary of angles for each step
def create_tan_table(x):
    tan = {}
    for i in range(x):
        tan[2**(-i)] = math.degrees(math.atan(2**(-i)))
    return tan

# setup x(0) = 1/Kn and y(0) = 0, accumulated angle z(0) = angle
# the factor Kn depends on the times of the iteration n
# which equals to sum  of sqrt(1+2**-n) = 1.0/0.60725 generally

def find_An(n):
    An = math.sqrt(2)
    for i in range(1,n):
        An = An * math.sqrt(1 + 2**(-2*i))
    return An

def cordic_iteration(angle,n,para): # iteration number and angle
#   fixtypex = [int(i1), int(f1), 's']      # setuo the format of the frac & Integer part
#   fixtypey = [int(i2), int(f2), 's']
    x_ini,y_ini = 1.0,0.0
    
    x = fpfunctions.RealRESIZE(x_ini, [int(para[0]), int(para[1]), "s"],'ClpRnd_NoWarn')
    y = fpfunctions.RealRESIZE(y_ini, [int(para[2]), int(para[3]), "s"], 'WrpRnd_NoWarn')
    z = fpfunctions.RealRESIZE(float(angle), [int(para[4]), int(para[5]), "s"], 'WrpRnd_NoWarn')
    tan_table = create_tan_table(2*n)

    for i in range(n+1):
        if z <= 0:
            di = -1.0
        else:
            di = 1.0
        
        newx = fpfunctions.RealRESIZE(x - (y * di * 2.0**(-i)), [int(para[0]), int(para[1]), "s"], 'ClpRnd_NoWarn')
        newy = fpfunctions.RealRESIZE(y + (x * di * 2.0**(-i)), [int(para[2]), int(para[3]), "s"], 'WrpRnd_NoWarn')
        x = newx
        y = newy
        z = fpfunctions.RealRESIZE(z - (di * tan_table[2.0**(-i)]), [int(para[4]), int(para[5]), "s"], 'WrpRnd_NoWarn')
#        print "intermediate value x y"+str(x)+' '+str(y)
    tri = x*x + y*y
    print 'cos(angle) = '+ str(x/tri)
    print 'sin(angle) = '+ str(y/tri)
    f = math.degrees(x)
    g = math.degrees(y)
    return f,g

def find_angle(t):
    x = t[0]
    y = t[1]
    if x == 0 :
        return 90
    else :
        return math.degrees(math.atan(y/x))

def find_err(angle,t):
    return math.sqrt((t-float(angle))**2)

def main(angle,para):
    t = cordic_iteration(float(angle), 50, para)
    print "angle rotated = ", find_angle(t)
    print "the err is = ", find_err(angle,find_angle(t))
    print find_err(angle,find_angle(t))

if __name__ == '__main__':
    angle = sys.argv[1]
    para = []
    for index in range(2,len(sys.argv)):
       temp = sys.argv[index]
       para.append(temp)
    print para
#    my_list = [str(item) for item in args.list.split()]
#    print "This is para " + parr
#    print "This is temp " + temp
    
    main(angle,para)

#    print "zzz" + list(para)
#    main(list(para))
else:
#    main(10,10,10,10)
     print "errrrrr"

