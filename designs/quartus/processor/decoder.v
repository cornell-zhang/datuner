module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);

input [15:0]  INST;

output [2:0]  DR;
output [2:0]  SA;
output [2:0]  SB;
output [5:0]  IMM;
output        MB;
output [2:0]  FS;
output        MD;
output        LD;
output        MW;
output [2:0]  BS;
output [5:0]  OFF;
output        HALT;

reg [2:0] DR;
reg [2:0] SA;
reg [2:0] SB;
reg 		  MB;
reg [2:0] FS;
reg 		  MD;
reg		    LD;
reg 		  MW;
reg [2:0] BS;
reg [5:0] OFF;
reg 		  HALT;
reg [5:0] IMM;

wire [3:0] OP;
wire [2:0] RS;
wire [2:0] RT;
wire [2:0] RD;
wire [2:0] FUNCT;
wire [5:0] IMM_INST;

assign OP = INST[15:12];
assign RS = INST[11:9];
assign RT = INST[8:6];
assign RD = INST[5:3];
assign FUNCT = INST[2:0];
assign IMM_INST = INST[5:0];

always @(*) begin
	case (OP)
		4'b0000: begin
			DR = 3'b0;
			SA = 3'b0;
			SB = 3'b0;
			MB = 1'b0;
			FS = 3'b0;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = (FUNCT == 3'b001) ? 1'b1 : 1'b0;
			IMM = IMM_INST;
		end
		4'b0010: begin
			DR = RT;
			SA = RS;
			SB = 3'b0;
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b1;
			LD = 1'b1;
			MW = 1'b0;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		4'b0100: begin
			DR = 3'b0;
			SA = RS;
			SB = RT;
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b1;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		4'b0101: begin
			DR = RT;
			SA = RS;
			SB = 3'b0;
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		4'b0110: begin
			DR = RT;
			SA = RS;
			SB = 3'b0;
			MB = 1'b1;
			FS = 3'b101;
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		4'b0111: begin
			DR = RT;
			SA = RS;
			SB = 3'b0;
			MB = 1'b1;
			FS = 3'b110;
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		4'b1000: begin
			DR = 3'b0;
			SA = RS;
			SB = RT;
			MB = 1'b0;
			FS = 3'b001;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			BS = 3'b000;
			OFF = IMM_INST;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		4'b1001: begin
			DR = 3'b0;
			SA = RS;
			SB = RT;
			MB = 1'b0;
			FS = 3'b001;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			BS = 3'b001;
			OFF = IMM_INST;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		4'b1010: begin
			DR = 3'b0;
			SA = RS;
			SB = 3'b0;
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			BS = 3'b010;
			OFF = IMM_INST;
			HALT = 1'b0;
			IMM = 6'b0;
		end
		4'b1011: begin
			DR = 3'b0;
			SA = RS;
			SB = 3'b0;
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			BS = 3'b011;
			OFF = IMM_INST;
			HALT = 1'b0;
			IMM = 6'b0;
		end
		4'b1111: begin
			DR = RD;
			SA = RS;
			SB = RT;
			MB = 1'b0;
			FS = FUNCT;
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
		default: begin
			DR = 3'b0;
			SA = 3'b0;
			SB = 3'b0;
			MB = 1'b0;
			FS = 3'b0;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			BS = 3'b100;
			OFF = 6'b0;
			HALT = 1'b0;
			IMM = IMM_INST;
		end
	endcase

end

endmodule
