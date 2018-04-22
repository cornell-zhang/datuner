module adder(A, B, CI, Y, C, V); // add all inputs and outputs inside parentheses



  // inputs
  input [7:0] A;

  input [7:0] B;

  input CI;

  

  // outputs
  output [7:0] Y;

  output C;

  output V;

  

  // reg and internal variable definitions
  wire C1;

  wire C2;

  wire C3;

  wire C4;

  wire C5;

  wire C6;

  wire C7;

  

  // implement module here
  one_bit_adder first(

	.A(A[0]),

	.B(B[0]),

	.CI(CI),

	.Y(Y[0]),

	.C(C1)

  );

  

   one_bit_adder second(

	.A(A[1]),

	.B(B[1]),

	.CI(C1),

	.Y(Y[1]),

	.C(C2)

  );

  

   one_bit_adder third(

	.A(A[2]),

	.B(B[2]),

	.CI(C2),

	.Y(Y[2]),

	.C(C3)

  );

  

   one_bit_adder fourth(

	.A(A[3]),

	.B(B[3]),

	.CI(C3),

	.Y(Y[3]),

	.C(C4)

  );

  

   one_bit_adder fifth(

	.A(A[4]),

	.B(B[4]),

	.CI(C4),

	.Y(Y[4]),

	.C(C5)

  );

  

   one_bit_adder sixth(

	.A(A[5]),

	.B(B[5]),

	.CI(C5),

	.Y(Y[5]),

	.C(C6)

  );

  

  one_bit_adder seventh(

	.A(A[6]),

	.B(B[6]),

	.CI(C6),

	.Y(Y[6]),

	.C(C7)

  );

  

  one_bit_adder eighth(

	.A(A[7]),

	.B(B[7]),

	.CI(C7),

	.Y(Y[7]),

	.C(C)

  );

  

  assign V = (C7 != C);

  

endmodule
