module signExtend(IN, OUT);

input [5:0] IN;

output [7:0] OUT;

assign OUT[5:0] = IN;
assign OUT[6] = IN[5];
assign OUT[7] = IN[5];

endmodule
