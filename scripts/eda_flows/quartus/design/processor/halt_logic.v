module halt_logic(CLK, HALT, EN_L, H);
	input CLK;
	input HALT;
	input EN_L;
	
	output H;
	
	reg EN_LAST;
	wire CLEAR_HALT;
	wire H;
	
	assign H = HALT & ~CLEAR_HALT;
	assign CLEAR_HALT = ~EN_L & EN_LAST;
	
	always @(posedge CLK) begin
		EN_LAST = EN_L;
	end
	
endmodule
