module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);

  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;

  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;


  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  reg [7:0] NextPC;
  wire      MW;


  // ADD YOUR CODE BELOW THIS LINE
  wire [2:0]  SA;
  wire [2:0]  SB;
  wire [2:0]  DR;
  wire        LD;
  wire [7:0]  DataA;
  wire [7:0]  DataB;
  wire [7:0]  DataC;
  wire [7:0]  DataD;
  wire [7:0]  ALUB;
  wire [7:0]  IMM_EXT;
  wire [5:0]  IMM;
  wire 	      MB;
  wire [2:0]  FS;
  wire        MD;
  wire	      HALT;
  wire	      H;
  wire [5:0]  OFF;
  wire 	      MP;
  wire [2:0]  BS;
  wire	      N;
  wire	      Z;
  wire [7:0]  OFF_EXT;
  

  registerFile regfile(

		.SA(SA),
		.SB(SB),
		.DR(DR),
		.D_IN(DataC),
		.LD(LD),
		.RESET(RESET),
		.DataA(DataA),
		.DataB(DataB),
		.CLK(CLK)

  );
  

  decoder hyperwave(

		.INST(Iin),
		.DR(DR),
		.SA(SA),
		.SB(SB),
		.IMM(IMM),
		.MB(MB),
		.FS(FS),
		.MD(MD),
		.LD(LD),
		.MW(MW),
		.BS(BS),
		.OFF(OFF),
		.HALT(HALT)
  );


  alu aluminum(

		.A(DataA),
		.B(ALUB),
		.OP(FS),
		.N(N),
		.Z(Z),
		.Y(DataD),
                .C(),
                .V(),
                .HEX0(),
                .HEX1(),
                .HEX2(),
                .HEX3(),
                .HEX4(),
                .HEX5(),
                .HEX6(),
                .HEX7()

  );

  
  signExtend theExtendables(

		.IN(IMM),
		.OUT(IMM_EXT)
  );


  eight_to_one_mux #(.WIDTH(1)) brancher(

		.A(Z),
		.B(~Z),
		.C(~N),
		.D(N),
		.E(1'b0),
		.F(1'b0),
		.G(1'b0),
		.H(1'b0),
		.SEL(BS),
		.Y(MP)

  );
	

  halt_logic halting_problem(

		.CLK(CLK),
		.HALT(HALT),
		.EN_L(EN_L),
		.H(H)

  );


  assign OFF_EXT[7] = OFF[5];
  assign OFF_EXT[6:1] = OFF;
  assign OFF_EXT[0] = 1'b0;
  
  assign ALUB = MB ? IMM_EXT : DataB;
  assign DataC = MD ? Din : DataD;

  always @(posedge CLK) begin
	if (RESET) begin
		PC = 8'b0;
	end else begin
		PC = NextPC;
	end
  end
  
  always @(*) begin
	if (H) begin
		NextPC = PC;
	end else if (MP) begin
		NextPC = PC + 8'd2 + OFF_EXT;
	end else begin
		NextPC = PC + 8'd2;
	end
  end

  // ADD YOUR CODE ABOVE THIS LINE

endmodule
