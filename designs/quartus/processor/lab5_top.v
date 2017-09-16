module lab5_top(CLK, SW, KEY, RESET_N, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

  input         CLK;
  input  [9:0]  SW;
  input  [3:0]  KEY;
  input         RESET_N;

  output [9:0]  LEDR;
  output [6:0]  HEX5;
  output [6:0]  HEX4;
  output [6:0]  HEX3;
  output [6:0]  HEX2;
  output [6:0]  HEX1;
  output [6:0]  HEX0;
  
  wire 		RESET;
  wire		EN_L;
  wire  [7:0]   IOA;
  wire	[7:0]	IOB;
  wire	[7:0]	IOC;
  wire	[7:0]	IOD;
  wire	[7:0]	IOE;
  wire	[7:0]	IOF;
  wire	[7:0]	IOG;


  assign RESET   = ~RESET_N;
  assign EN_L    = KEY[2];


  lab5 daCore(

    .CLK(CLK),
    .RESET(RESET),
    .IOA(IOA),
    .IOB(IOB),
    .IOC(IOC),
    .EN_L(EN_L),
    .IOD(IOD),
    .IOE(IOE),
    .IOF(IOF),
    .IOG(IOG)

  );


  dual_reg_in inputs(

    .CLK(CLK),
    .IN(SW[7:0]),
    .SEL(SW[8]),
    .WEN_L(KEY[3]),
    .OUTA(IOA),
    .OUTB(IOB)

  );

  
  // PUSHBUTTON INPUT LOGIC
  assign IOC[7:2]		= 6'b0;
  assign IOC[1]		= ~KEY[1];
  assign IOC[0]		= ~KEY[0];

  
  // LED ARRAY LOGIC
  assign LEDR[9]     = CLK;
  assign LEDR[8]     = 1'b0;
  assign LEDR[7:0]   = IOD;

  
  // SEVEN-SEGMENT DISPLAY DRIVERS
  
  hex_to_seven_seg upperIOG(
    .B(IOG[7:4]),
    .SSEG_L(HEX5)
  );
  
  hex_to_seven_seg lowerIOG(
    .B(IOG[3:0]),
    .SSEG_L(HEX4)
  );
  
  hex_to_seven_seg upperIOF(
    .B(IOF[7:4]),
    .SSEG_L(HEX3)
  );
  
  hex_to_seven_seg lowerIOF(
    .B(IOF[3:0]),
    .SSEG_L(HEX2)
  );
  
  hex_to_seven_seg upperIOE(
    .B(IOE[7:4]),
    .SSEG_L(HEX1)
  );
  
  hex_to_seven_seg lowerIOE(
    .B(IOE[3:0]),
    .SSEG_L(HEX0)
  );
            
endmodule
