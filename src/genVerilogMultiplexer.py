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
   # Multiplicand = 5+x #raw_input('please into the multiplicand:')
   # MidddleResult = TheMultiplier + Multiplicand + 1
    #initial_value = str(TheMultiplier+1)
    #for k in range(0,TheMultiplier):
    #  initial_value = initial_value+'0'
    #initial_value = initial_value+'1'
    MidddleResult = TheMultiplier
    TheMultiplier = str(TheMultiplier)
    #Multiplicand = str(Multiplicand)
    float_width = float(TheMultiplier)
    tran_multiplexer = int(math.log(float_width,2))+1
    tran_multiplexer = str(tran_multiplexer)
    #Multiplicand  = str(Multiplicand)
    MidddleResult = str(MidddleResult)
    MultiplierRange ='input '+'['+TheMultiplier+':0]in_data'
    multiplexer_width_range = 'input'+'['+tran_multiplexer+':0]in_control_data'
    MultiplicandRandRange ='reg '+'['+tran_multiplexer+':0]reg_control'
    InputClock = 'input in_clk'
    OutputOfResult = 'output out_data'

    #firstC = 'reg '+'['+Multiplicand+':0]c'
    firstC = 'reg c'
    RegC = 'reg '+'['+TheMultiplier+':0]a_reg'
    #RegC = 'reg '+'['+TheMultiplier+':0]a_reg'
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
    FileName = 'multiplexer'  #raw_input('Please into the file name: ')
    MyFile = open(FileName+'.v','w')
    MyFile.write('module multiplexer(in_data,in_control_data,in_clk,out_data);\n')
    MyFile.write(MultiplierRange+';\n')
    #MyFile.write(MultiplicandRandRange+';\n')
    MyFile.write(multiplexer_width_range+';\n')
    MyFile.write(MultiplicandRandRange+';\n')
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
        #MyFile.write('reg '+'['+Multiplicand+':0]'+lst[j1]+';\n')

        MyFile.write('reg '+lst[j1]+';\n')

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
    MyFile.write('reg_control <= in_control_data;\n')
    #MyFile.write('b_reg <= in_data2;\n')
    MyFile.write('case(reg_control)\n')
    tmp_TheMultiplier = int(TheMultiplier)+1
    for j2 in xrange(0,tmp_TheMultiplier):
      str_j2 = str(j2)
      tmp_multiplexer1 = str_j2+': c <='+ 'a_reg['+str_j2+'];\n'
      MyFile.write(tmp_multiplexer1)
    #MyFile.write(tmp_multiplexer2)
    tmp_default = 'default:$display("control error")'+';\n'
    MyFile.write(tmp_default)
    MyFile.write("endcase\n")
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
      MyFile.write('assign out_data = '+lst[0]+';\n')
    else:
      MyFile.write('assign out_data  = '+lst[i]+';\n')
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

