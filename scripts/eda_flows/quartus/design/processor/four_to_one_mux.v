module four_to_one_mux (A, B, C, D, SEL, Y);

	

	parameter WIDTH = 1;

	

	input [WIDTH - 1: 0] A;

	input [WIDTH - 1: 0] B;

	input [WIDTH - 1: 0] C;

	input [WIDTH - 1: 0] D;

	input [1:0] SEL;

	

	output[WIDTH-1:0] Y;



	reg [WIDTH-1:0] Y;

	

	always @(*) begin 

		case (SEL) 

			2'd0: Y = A;

			2'd1: Y = B;

			2'd2: Y = C;

			2'd3: Y = D;

			default: Y = {WIDTH{1'bX}};

		endcase 

	end

	

endmodule
