module registerFile(SA, SB, DR, D_IN, LD, RESET, DataA, DataB, CLK);

input [2:0] SA;
input [2:0] SB;
input [2:0] DR;
input [7:0] D_IN;
input	      LD;
input       RESET;
input       CLK;

output [7:0] DataA;
output [7:0] DataB;

reg [7:0] regs [7:0];

wire [7:0] DataA;
wire [7:0] DataB;

assign DataA = regs[SA];
assign DataB = regs[SB];

integer i;

always @(posedge CLK) begin
	if (RESET) begin
		for (i = 0; i < 8; i = i + 1) begin
			regs[i] <= 8'b0;
		end
	end else begin
		if (LD) begin
			i = 0;
			regs[DR] = D_IN;
		end
	end
end

endmodule
