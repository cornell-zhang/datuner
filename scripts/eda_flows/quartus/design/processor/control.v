module control(OP, CISEL, BSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP); // add other inputs and outputs here

  // inputs (add others here)
  input  [2:0]  OP;

  // outputs (add others here)
  output        CISEL;

  output 		 BSEL;

  output [1:0]	 OSEL;

  output 		 SHIFT_LA;

  output 		 SHIFT_LR;

  output 	    LOGICAL_OP;


  // reg and internal variable definitions
  reg [1:0] OSEL;

  reg SHIFT_LA;

  reg SHIFT_LR;

  reg LOGICAL_OP;

  

  localparam ADD = 3'b000;

  localparam SUB = 3'b001;

  localparam SRA = 3'b010;

  localparam SRL = 3'b011;

  localparam SLL = 3'b100;

  localparam AND = 3'b101;

  localparam OR = 3'b110;

  

  

  // implement module here (add other control signals below)
  assign CISEL = (OP == 3'b001) ? 1'b1 : 1'b0;

  assign BSEL = (OP == 3'b001) ? 1'b1 : 1'b0;

  

  always @(*) begin

	case (OP)

		ADD: begin 

			  OSEL = 2'b0;

			  SHIFT_LA = 1'b0;

			  SHIFT_LR = 1'b0;

			  LOGICAL_OP = 1'b0;

		end

		SUB: begin

			  OSEL = 2'b0;

		     SHIFT_LA = 1'b0;

			  SHIFT_LR = 1'b0;

			  LOGICAL_OP = 1'b0;

		end

		SRA: begin 

		     OSEL = 2'b01;

		     SHIFT_LA = 1'b1;

			  SHIFT_LR = 1'b1;

			  LOGICAL_OP = 1'b0;

		end

		SRL: begin 

			  OSEL = 2'b01;

		     SHIFT_LA = 1'b0;

			  SHIFT_LR = 1'b1;

			  LOGICAL_OP = 1'b0;

		end

		SLL: begin 

			  OSEL = 2'b01;

		     SHIFT_LA = 1'b1;

			  SHIFT_LR = 1'b0;

			  LOGICAL_OP = 1'b0;

		end

		AND: begin 

		     OSEL = 2'b10;

		     SHIFT_LA = 1'b0;

			  SHIFT_LR = 1'b0;

			  LOGICAL_OP = 1'b1;

		end

		OR:  begin 

			  OSEL = 2'b10;

		     SHIFT_LA = 1'b0;

			  SHIFT_LR = 1'b0;

			  LOGICAL_OP = 1'b0;

		end

		default: begin 

			  OSEL = 2'b11;

		     SHIFT_LA = 1'b0;

			  SHIFT_LR = 1'b0;

			  LOGICAL_OP = 1'b0;

		end

	endcase

  end

  

endmodule
