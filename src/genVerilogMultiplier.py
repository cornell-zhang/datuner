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
pipeline = sys.argv[3]
for x in range(int(sys.argv[1]),int(sys.argv[2])):
    TheMultiplier = x #raw_input('Please into the multiplier: ')
    Multiplicand = x #raw_input('please into the multiplicand:')
    MidddleResult = TheMultiplier + Multiplicand + 1
    TheMultiplier = str(TheMultiplier)
    Multiplicand  = str(Multiplicand)
    MidddleResult = str(MidddleResult)
    MultiplierRange ='input '+'['+TheMultiplier+':0]a'
    MultiplicandRandRange ='input '+'['+Multiplicand+':0]b'
    InputClock = 'input in_clk'
    OutputOfResult = 'output '+'['+MidddleResult+':0]d'
   # tt = int(sys.argv[3])
    firstC = 'reg '+'['+MidddleResult+':0]c['+pipeline+':0]'
    RegC = 'reg '+'['+TheMultiplier+':0]a_reg'
    RegD = 'reg '+'['+Multiplicand+':0]b_reg'   
    x1 = str(x)
  #  FileName = 'multiVerilog_'+x1+'_'+x1+'_'+sys.argv[3]  #raw_input('Please into the file name: ')
  #  pipeline = str(pipeline)
    FileName = 'multiplier' #raw_input('Please into the file name: ')

    MyFile = open(FileName+'.v','w')
    MyFile.write('module multiplier(a,b,in_clk,d);\n')
    MyFile.write(MultiplierRange+';\n')
    MyFile.write(MultiplicandRandRange+';\n')
    MyFile.write(InputClock+';\n')
    MyFile.write(OutputOfResult+';\n')
    MyFile.write('integer i;\n')
   # MyFile.write('integer j;\n')
    MyFile.write(firstC+';\n')
    MyFile.write(RegC+';\n')
    MyFile.write(RegD+';\n')
    tt = int(pipeline)   
    MyFile.write('always @ (posedge in_clk)\n')
    MyFile.write('begin\n')
#    if tt!=2:
    MyFile.write('a_reg <= a;\n')
    MyFile.write('b_reg <= b;\n')
    MyFile.write('c[0] <= a_reg*b_reg;\n')
    MyFile.write('for(i=0; i<'+pipeline+'; i=i+1)\n')
    MyFile.write('  c[i+1] <= c[i];\n')         
    MyFile.write('end\n')
    MyFile.write('assign d = c['+pipeline+'];\n')    
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

