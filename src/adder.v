module adder #(parameter BITS = 32) (CLK, a, b, out);
  input			CLK;
  input		[BITS-1:0]	a;
  input		[BITS-1:0]	b;
  output reg 	[BITS-1:0] 	out;

  reg		[BITS-1:0]	a_reg;
  reg		[BITS-1:0]	b_reg;

  always@(posedge CLK) begin
	a_reg <= a;
	b_reg <= b;
  	out <= a_reg + b_reg;
  end
            
endmodule
