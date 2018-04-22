module dual_reg_in(CLK, IN, SEL, WEN_L, OUTA, OUTB);

  input        CLK;
  input  [7:0] IN;
  input			SEL;
  input		   WEN_L;
  
  output [7:0] OUTA;
  output [7:0] OUTB;
  
  reg    [7:0] OUTA;
  reg    [7:0] OUTB;
  
  always @(posedge CLK) begin
	if (~WEN_L) begin
		if (SEL)
			OUTB = IN;
		else
			OUTA = IN;
	end
  end
 
 endmodule
