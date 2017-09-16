module lab5(CLK, RESET, IOA, IOB, IOC, EN_L, PC, NextPC, Iin, DataA, DataB, DataC, DataD, Din, MW, IOD, IOE, IOF, IOG);

  input         CLK;
  input         RESET;
  input  [7:0]  IOA;
  input  [7:0]  IOB;
  input  [7:0]  IOC;
  input         EN_L;

  output [7:0]  PC;
  output [7:0]  NextPC;
  output [15:0] Iin;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output [7:0]  Din;
  output        MW;
  output [7:0]  IOD;
  output [7:0]  IOE;
  output [7:0]  IOF;
  output [7:0]  IOG;
 

  cpu proc(

    .CLK(CLK),
    .RESET(RESET),
    .PC(PC),
    .NextPC(NextPC),
    .Iin(Iin),
    .DataA(DataA),
    .DataB(DataB),
    .DataC(DataC),
    .DataD(DataD),
    .Din(Din),
    .MW(MW),
    .EN_L(EN_L)

  );
    

  // BELOW IS THE ONLY LINE YOU SHOULD HAVE TO MODIFY IN THIS FILE
  lab5iram1B program2run(

    .CLK(CLK),
    .RESET(RESET),
    .ADDR(PC),
    .Q(Iin)

  );


  lab5dram memory(

    .CLK(CLK),
    .RESET(RESET),
    .ADDR(DataD),
    .DATA(DataB),
    .MW(MW),
    .Q(Din),
    .IOA(IOA),
    .IOB(IOB),
    .IOC(IOC),
    .IOD(IOD),
    .IOE(IOE),
    .IOF(IOF),
    .IOG(IOG)

  );

endmodule
