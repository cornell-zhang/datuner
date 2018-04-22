module eight_to_one_mux(A, B, C, D, E, F, G, H, SEL, Y);

	parameter WIDTH = 1;
	
	input [WIDTH - 1: 0] A;
	input [WIDTH - 1: 0] B;
	input [WIDTH - 1: 0] C;
	input [WIDTH - 1: 0] D;
	input [WIDTH - 1: 0] E;
	input [WIDTH - 1: 0] F;
	input [WIDTH - 1: 0] G;
	input [WIDTH - 1: 0] H;
	input [2:0] SEL;
	
	output[WIDTH-1:0] Y;
	
	wire [WIDTH-1:0] Y_A;
	wire [WIDTH-1:0] Y_B;
	
	four_to_one_mux #(.WIDTH(WIDTH)) muxA(
						 .A(A),
						 .B(B),
						 .C(C),
						 .D(D),
						 .SEL(SEL[1:0]),
						 .Y(Y_A)
	);
	
	four_to_one_mux #(.WIDTH(WIDTH)) muxB(
						 .A(E),
						 .B(F),
						 .C(G),
						 .D(H),
						 .SEL(SEL[1:0]),
						 .Y(Y_B)
	);
	
	assign Y = SEL[2] ? Y_B : Y_A;
endmodule
