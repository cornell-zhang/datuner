module hex_to_seven_seg(B, SSEG_L);

  input  [3:0]  B;

  output [6:0]  SSEG_L;



  reg    [6:0]  SSEG_L;



// synthesis translate_off
`define SIMULATION_MODE

// synthesis translate_on
`ifdef SIMULATION_MODE

  wire [3:0] BB;



  assign BB = B;

`else

  reg [3:0] BB;



  SOFT u1(

    .in(B[0]),

    .out(BB[0])

  );

  SOFT u2(

    .in(B[1]),

    .out(BB[1])

  );

  SOFT u3(

    .in(B[2]),

    .out(BB[2])

  );

  SOFT u4(

    .in(B[3]),

    .out(BB[3])

  );

`endif



  always @ (BB)

  begin

    case (BB)

      // segment order: GFEDCBA (active low)
      4'h0 : SSEG_L = 7'b1000000;

      4'h1 : SSEG_L = 7'b1111001;

      4'h2 : SSEG_L = 7'b0100100;

      4'h3 : SSEG_L = 7'b0110000;

      4'h4 : SSEG_L = 7'b0011001;

      4'h5 : SSEG_L = 7'b0010010;

      4'h6 : SSEG_L = 7'b0000010;

      4'h7 : SSEG_L = 7'b1111000;

      4'h8 : SSEG_L = 7'b0000000;

      4'h9 : SSEG_L = 7'b0010000;

      4'hA : SSEG_L = 7'b0001000;

      4'hB : SSEG_L = 7'b0000011;

      4'hC : SSEG_L = 7'b1000110;

      4'hD : SSEG_L = 7'b0100001;

      4'hE : SSEG_L = 7'b0000110;

      4'hF : SSEG_L = 7'b0001110;

      default : SSEG_L = 7'b1111111;

    endcase

  end



endmodule
