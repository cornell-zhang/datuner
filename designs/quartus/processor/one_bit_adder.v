module one_bit_adder(A, B, CI, Y, C);

	input A;

	input B;

	input CI;

	

	output Y;

	output C;

	

	assign Y = (A^B) ^ CI;

	assign C = (A & B) | (A & CI) | (B & CI);

	

endmodule
