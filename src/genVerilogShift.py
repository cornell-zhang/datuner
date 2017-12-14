# -*- coding: utf-8 -*-
"""
Created on Thu Dec 03 04:50:50 2015

@author: Administrator
"""
#import math
import sys
import math
x = 1
y = 1
z = 1
for x in range(int(sys.argv[1]),int(sys.argv[2])):
    TheMultiplier = 5+x #raw_input('Please into the multiplier: ')
    #Multiplicand = 5+x #raw_input('please into the multiplicand:')
   # MidddleResult = TheMultiplier + Multiplicand + 1
    #initial_value = str(TheMultiplier+1)+"'b"
    #for k in range(0,TheMultiplier):
    #  initial_value = initial_value+'0'
    #initial_value = initial_value+'1'
    MidddleResult = TheMultiplier
    TheMultiplier = str(TheMultiplier)
    float_width = float(TheMultiplier)
    tran_shift = int(math.log(float_width))+1
    tran_shift = str(tran_shift)
    #Multiplicand  = str(Multiplicand)
    MidddleResult = str(MidddleResult)
    MultiplierRange ='input '+'['+TheMultiplier+':0]in_data'
    shift_width_range = 'input '+'['+tran_shift+':0]shift_width'
    #MultiplicandRandRange ='input '+'['+Multiplicand+':0]b'
    InputClock = 'input in_clk'
    OutputOfResult = 'output '+'['+MidddleResult+':0]d'
    firstC = 'reg '+'['+MidddleResult+':0]c'
    RegC = 'reg '+'['+TheMultiplier+':0]a_reg'

    #RegD = 'reg '+'['+Multiplicand+':0]b_reg'

    lst =["c"]         #["c","c1","c2","c3","c4"]
    j = 1
    for j in range(1,int(sys.argv[3])):
        j = str(j)
        temp_c = 'c'+j
        print temp_c
        lst.append(temp_c)
    x1 = str(x)
    print("lst")
    print lst
    FileName = 'shiftVerilog_'+x1+'_'+x1+'_'+sys.argv[3]  #raw_input('Please into the file name: ')
    MyFile = open(FileName+'.v','w')
    MyFile.write('(* use_dsp48 = "yes" *)module multiplexer(in_data,shift_width,in_clk,d);\n')
    MyFile.write(MultiplierRange+';\n')
    #MyFile.write(MultiplicandRandRange+';\n')
    MyFile.write(shift_width_range+';\n')
    #MyFile.write(MultiplicandRandRange+';\n')
    MyFile.write(InputClock+';\n')
    MyFile.write(OutputOfResult+';\n')
    MyFile.write(firstC+';\n')
    MyFile.write(RegC+';\n')
    #MyFile.write(RegD+';\n')
    # loop set initial value
    j1 = 0
    for j1 in xrange(len(lst)):
        if j1 ==0 :
            continue
        MyFile.write('reg '+'['+MidddleResult+':0]'+lst[j1]+';\n')
    #MyFile.write('initial a_reg ='+initial_value+';\n')
    MyFile.write('always @(posedge in_clk)\n')
    MyFile.write('begin\n')
    #if j1 != 1:
    #tmp_initial_value = 'a_reg <='+initial_value+';\n'
    #MyFile.write(tmp_initial_value)
    #MyFile.write('b_reg <= b;\n')
   # if j1==1:
   #   MyFile.write('c <= a+b;\n')
   # else:
    MyFile.write('a_reg <= in_data;\n')
    tmp_shift = 'c <= a_reg<<shift_width'+';\n'
    MyFile.write(tmp_shift)
    i = 0;
    for i in xrange(len(lst)-1):
        print("z")
        z = len(lst)
        print z
        print("i")
        print i
        if(i==0):
          continue
        else:
          MyFile.write(lst[i]+'<='+lst[i-1]+';\n')
        #if i == z-2:
        #    MyFile.write('d<='+lst[i+1]+';\n')
    MyFile.write('end\n')
    if(len(lst)==2):
      MyFile.write('assign d = '+lst[0]+';\n')
    else:
      MyFile.write('assign d = '+lst[i]+';\n')
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

