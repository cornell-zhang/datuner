module shifter(A, LA, LR, Y, C); // add all inputs and outputs inside parentheses



  // inputs
  input [7:0] A;

  input LA;

  input LR;

  

  // outputs
  output [7:0] Y;

  output C;  

  

  // reg and internal variable definitions
  reg [7:0] Y;

  reg C;

  

  // implement module here
  always @(*) begin

  	if (LR) begin

  		if (LA) begin

  			//SRA
  			C = A[0];

  			Y = {A[7], A[7:1]};

  		end else begin

  			//SRL
  			C = A[0];

  			Y = {1'b0, A[7:1]};

  		end

  	end else begin

  		//SLL
  		C = A[7];

  		Y = {A[6:0], 1'b0};

  	end

  end



  

endmodule
