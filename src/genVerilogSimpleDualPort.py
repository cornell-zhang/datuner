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
    TheMultiplier = x #raw_input('Please into the multiplier: ')
    Multiplicand = x #raw_input('please into the multiplicand:')
   # MidddleResult = TheMultiplier + Multiplicand + 1
    #initial_value = str(TheMultiplier+1)+"'b"
    #for k in range(0,TheMultiplier):
    #  initial_value = initial_value+'0'
    #initial_value = initial_value+'1'
    MidddleResult = TheMultiplier
    MidddleResult1 = TheMultiplier+1
    TheMultiplier = str(TheMultiplier)
    Multiplicand = str(Multiplicand)
    #calculate the address
    float_width = float(MidddleResult1)
    #if MidddleResult%2==0:
    #  tran_multiplexer = int(math.log2(float_width))
    #else:
    print "#float_width\n"
    print float_width;
    tran_multiplexer = int(math.log(float_width,2))
    #tran_multiplexer = tran_multiplexer-1
    print "#tran_multiplexer\n"
    print tran_multiplexer;
    tran_multiplexer = str(tran_multiplexer)
    #Multiplicand  = str(Multiplicand)
    MidddleResult = str(MidddleResult)
    MultiplierRange ='input '+'['+TheMultiplier+':0]mem_dina'
    MultiplierRange1 ='reg '+'['+TheMultiplier+':0]tmp_mem_dina'

    multiplexer_width_range = 'input mem_ena'
    multiplexer_width_range = 'input mem_ena'
    MultiplicandRandRange ='input '+'['+Multiplicand+':0]mem_addra'
    MultiplicandRandRange1 ='input '+'['+Multiplicand+':0]mem_addrb'

    MultiplicandRandRange2 ='reg '+'['+Multiplicand+':0]tmp_mem_addra'
    MultiplicandRandRange3 ='reg '+'['+Multiplicand+':0]tmp_mem_addrb'

    InputClock = 'input mem_clka'
    OutputOfResult = 'output '+'['+Multiplicand+':0] mem_douta'
    firstC = 'reg '+'['+Multiplicand+':0]mem_dina_reg'
    RegC = 'reg'+'['+TheMultiplier+':0]mem_douta_reg'
    RegD = 'reg '+'['+TheMultiplier+':0]mem_addra_reg[511:0]'
    #reg_e = 'wire '+'['+TheMultiplier+':0]mem_douta_reg'
    lst =["mem_douta_reg"]         #["mem_douta_reg","c1","c2","c3","c4"]
    j = 1
    for j in range(1,int(sys.argv[3])):
        j = str(j)
        temp_c = 'c'+j
        print temp_c
        lst.append(temp_c)
    x1 = str(x)
    print("lst")
    print lst
    FileName = 'bram_test'  #raw_input('Please into the file name: ')
    MyFile = open(FileName+'.v','w')
    MyFile.write('module bram_test(mem_clka,mem_ena,mem_enb,mem_wea,mem_addra,mem_addrb,mem_dina,mem_douta);\n')
    MyFile.write(MultiplierRange+';\n')
    MyFile.write(MultiplierRange1+';\n')

    MyFile.write(MultiplicandRandRange+';\n')
    MyFile.write(MultiplicandRandRange1+';\n')

    MyFile.write(MultiplicandRandRange2+';\n')
    MyFile.write(MultiplicandRandRange3+';\n')

    MyFile.write(multiplexer_width_range+';\n')
    MyFile.write('input mem_wea;\n')
    MyFile.write('input mem_enb;\n')
    #MyFile.write(MultiplicandRandRange+';\n')
    MyFile.write(InputClock+';\n')
    MyFile.write(OutputOfResult+';\n')
    MyFile.write(firstC+';\n')
    MyFile.write(RegC+';\n')
    MyFile.write(RegD+';\n')
#    MyFile.write(reg_e+';\n')
    # loop set initial value
    # loop set initial value
    j1 = 0
    for j1 in xrange(len(lst)):
        if j1 ==0 :
            continue
        MyFile.write('reg '+'['+Multiplicand+':0]'+lst[j1]+';\n')
    #MyFile.write('initial a_reg ='+initial_value+';\n')
    MyFile.write('always @(posedge mem_clka)\n')
    MyFile.write('begin\n')
    MyFile.write('if(mem_ena)\n')
    MyFile.write('  begin\n')
    MyFile.write('   if(mem_wea)\n')
    MyFile.write('     tmp_mem_dina <= mem_dina;\n')
    MyFile.write('     tmp_mem_addra <= mem_addra;\n')
    MyFile.write('     mem_addra_reg[tmp_mem_addra] <= tmp_mem_dina;\n')
    MyFile.write('  end\n')
    MyFile.write('end\n')

    #always b
    MyFile.write('always @(posedge mem_clka)\n')
    MyFile.write('begin\n')
    MyFile.write('if(mem_enb)\n')
    MyFile.write('  begin\n')
    MyFile.write('     tmp_mem_addrb <= mem_addrb;\n')
    MyFile.write('     mem_douta_reg <= mem_addra_reg[tmp_mem_addrb];\n')
    MyFile.write('  end\n')


    #if j1 != 1:
    #tmp_initial_value = 'a_reg <='+initial_value+';\n'
    #MyFile.write(tmp_initial_value)
    #MyFile.write('b_reg <= b;\n')
   # if j1==1:
   #   MyFile.write('c <= a+b;\n')
   # else:
    #MyFile.write(tmp_multiplexer1)
    #MyFile.write(tmp_multiplexer2)
    #MyFile.write(tmp_default)
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
    #if(len(lst)==2):
    #   MyFile.write('assign mem_douta = '+lst[0]+';\n')
    #else:
    #  MyFile.write('assign mem_douta  = '+lst[i]+';\n')
    #invoke ip core

    if(len(lst)==2):
      MyFile.write('assign mem_douta = '+lst[0]+';\n')
    else:
      MyFile.write('assign mem_douta = '+lst[-1]+';\n')

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

