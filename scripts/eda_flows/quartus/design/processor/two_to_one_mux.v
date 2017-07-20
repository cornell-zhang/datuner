module two_to_one_mux(A, B, SEL, Y);

	

	parameter WIDTH = 1;



	input [WIDTH - 1: 0] A;

	input [WIDTH - 1: 0] B;

	input SEL;

	

	output [WIDTH - 1: 0] Y;

	

	wire [WIDTH-1:0] Y;

	

	assign Y = (SEL) ? B : A;

	

endmodule
