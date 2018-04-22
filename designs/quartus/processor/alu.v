module alu(A, B, OP, Y, C, V, N, Z, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;
  output [6:0]  HEX7;
  output [6:0]  HEX6;
  output [6:0]  HEX5;
  output [6:0]  HEX4;
  output [6:0]  HEX3;
  output [6:0]  HEX2;
  output [6:0]  HEX1;
  output [6:0]  HEX0;

  // ADD YOUR CODE BELOW THIS LINE
  wire CISEL; 

  wire BSEL;

  wire [1:0] OSEL;

  wire LA;

  wire LR;

  wire LOP;

  wire [7:0] LY;

  wire CSHIFT;

  wire CI;

  wire [7:0] BMUX;

  wire [7:0] SHY;

  wire ADC;

  wire ADV;

  wire [7:0] ADY;

 
  control freak(
    // port mappings go here
    	 .OP(OP),

	 .CISEL(CISEL), 

	 .BSEL(BSEL), 

	 .OSEL(OSEL), 

	 .SHIFT_LA(LA), 

	 .SHIFT_LR(LR), 

	 .LOGICAL_OP(LOP)
  );

  logical paradox(
    // port mappings go here
    	 .A(A), 

	 .B(BMUX), 

	 .OP(LOP), 

	 .Y(LY)
  );  
  
  shifter iDontGiveAShift(
    // port mappings go here
    	 .A(A), 

	 .LA(LA), 

	 .LR(LR), 

	 .Y(SHY), 

	 .C(CSHIFT)
  );

  

  two_to_one_mux #(.WIDTH(8)) bmux(

	.A(B),

	.B(~B),

	.SEL(BSEL),

	.Y(BMUX)

  );

  

  two_to_one_mux #(.WIDTH(1)) cselMux(

	.A(1'b0),

	.B(1'b1),

	.SEL(CISEL),

	.Y(CI)

  );

  

  four_to_one_mux #(.WIDTH(8)) outputMux(

	.A(ADY),

	.B(SHY),

	.C(LY),

	.D(8'b0),

	.SEL(OSEL),

	.Y(Y)

  );

  

  assign N = Y[7];

  assign Z = Y == 8'b0;

  

  assign C = (OSEL == 2'b00) ? ADC : ((OSEL == 2'b01) ? CSHIFT : 1'b0);

  assign V = (OSEL == 2'b00) ? ADV : 1'b0;

  

  adder addendum(

	.A(A),

	.B(BMUX),

	.CI(CI),

	.Y(ADY),

	.C(ADC),

	.V(ADV)

  );

  // ADD YOUR CODE ABOVE THIS LINE

  // SEVEN-SEGMENT DISPLAY DRIVERS

  // replace unused segments with code to disable display
  assign HEX5 = 7'b1111111;
  assign HEX4 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX2 = 7'b1111111;
  assign HEX1 = 7'b1111111;
  assign HEX0 = 7'b1111111;

  hex_to_seven_seg upperBitsOfY(
    .B(Y[7:4]),
    .SSEG_L(HEX7)
  );

  hex_to_seven_seg lowerBitsOfY(
    .B(Y[3:0]),
    .SSEG_L(HEX6)
  );

endmodule
