# -*- coding: utf-8 -*-
"""
Created on Thu Dec 03 04:50:50 2015

@author: Administrator
"""
#import math
import sys
x = 1
y = 1
z = 1
for x in range(int(sys.argv[1]),int(sys.argv[2])):
    TheMultiplier = x #raw_input('Please into the multiplier: ')
    Multiplicand = x #raw_input('please into the multiplicand:')
   # MidddleResult = TheMultiplier + Multiplicand + 1
    MidddleResult = TheMultiplier + 1
    TheMultiplier = str(TheMultiplier)
    Multiplicand  = str(Multiplicand)
    MidddleResult = str(MidddleResult)
    MultiplierRange ='input '+'['+TheMultiplier+':0]a'
    MultiplicandRandRange ='input '+'['+Multiplicand+':0]b'
    InputClock = 'input in_clk'
    OutputOfResult = 'output '+'['+MidddleResult+':0]d'
    firstC = 'reg '+'['+MidddleResult+':0]c'
    RegC = 'reg '+'['+TheMultiplier+':0]a_reg'
    RegD = 'reg '+'['+Multiplicand+':0]b_reg'

    lst = ["c"]          #["c","c1","c2","c3","c4"]
    j = 1
    for j in range(1,int(sys.argv[3])):
        j = str(j)
        temp_c = 'c'+j
        print temp_c
        lst.append(temp_c)
    x1 = str(x)
    FileName = 'adder'  #raw_input('Please into the file name: ')
    MyFile = open(FileName+'.v','w')
    MyFile.write('(* use_dsp48 = "yes" *)module adder(a,b,in_clk,d);\n')
    MyFile.write(MultiplierRange+';\n')
    MyFile.write(MultiplicandRandRange+';\n')
    MyFile.write(InputClock+';\n')
    MyFile.write(OutputOfResult+';\n')
    MyFile.write(firstC+';\n')
    MyFile.write(RegC+';\n')
    MyFile.write(RegD+';\n')
    j1 = 0
    for j1 in xrange(len(lst)):
        if j1 ==0 :
            continue
        MyFile.write('reg '+'['+MidddleResult+':0]'+lst[j1]+';\n')
    MyFile.write('always @ (posedge in_clk)\n')
    MyFile.write('begin\n')
    #if j1 != 1:
    MyFile.write('a_reg <= a;\n')
    MyFile.write('b_reg <= b;\n')
   # if j1==1:
   #   MyFile.write('c <= a+b;\n')
   # else:
    MyFile.write('c <= a_reg+b_reg;\n')
    for i in xrange(len(lst)-1):
        z = len(lst)
        print z
        print i
        MyFile.write(lst[i+1]+'<='+lst[i]+';\n')
        #if i == z-2:
        #    MyFile.write('d<='+lst[i+1]+';\n')
    MyFile.write('end\n')
    MyFile.write('assign d = '+lst[-1]+';\n')
    MyFile.write('endmodule\n')
    MyFile.close

 #   for y in range(1,11):
 #       y1 = str(y)
  #      MyFile = open(FileName+'_'+y1+'.xdc','w')
   #     z = 2*y
    #    z1 = str(z)
     #   MyFile.write('#Define the top level system clock of the design\n')
      #  MyFile.write('create_clock -period  '+z1+' -name  in_clk [get_ports in_clk]\n')
       # MyFile.close
    # print y1 + ' Timing Files have been created, congratulation\n'

