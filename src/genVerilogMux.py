import math, sys

bitwidth = int(sys.argv[1])
inputs = int(sys.argv[2])

input_names = ""
for i in range(0, inputs):
	input_names = input_names + "din_" + str(i) + ", "

sel_width = int(math.ceil(math.log(inputs, 2)))

outstring = ""
outstring += ('module mux(clk, ' + input_names + 'sel, out);\n')
outstring += ('input		clk;\n')
for i in range(0, inputs):
	outstring += ('input [' + str(bitwidth-1) + ':0] din_' + str(i) + ';\n')
outstring += ('input [' + str(sel_width-1) + ':0] sel;\n')
outstring += ('output [' + str(bitwidth-1) + ':0] out;\n')
outstring += ('reg [' + str(bitwidth-1) + ':0] out;\n')
outstring += ('always @(posedge clk) begin\n')
outstring += ('	case(sel)\n')
for i in range(0, inputs):
	outstring += ('		' + str(i) + ': out <= din_' + str(i) + ';\n')
outstring += ('		default: out <= din_0;\n')
outstring += ('	endcase\n')
outstring += ('end\n')
outstring += ('endmodule\n')

filename = 'mux.v'
outfile = open(filename,'w')
outfile.write(outstring)
