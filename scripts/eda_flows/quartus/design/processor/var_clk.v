module var_clk(clock_sel, clock_50MHz, var_clock);



	/* Variable speed clock for Digital Clock Lab.  
  	
 * 	clock_50MHz -- 50MHz input clock
 * 	var_clock   -- Variable output clock 
 * 	clock_sel   -- output clock selection
 *
  	3'b000 : var_clock = clock_1Hz;
        3'b001 : var_clock = clock_10Hz;
        3'b010 : var_clock = clock_100Hz;
        3'b011 : var_clock = clock_1kHz;
        3'b100 : var_clock = clock_10kHz;
        3'b101 : var_clock = clock_100kHz;
        3'b110 : var_clock = clock_1MHz;
        3'b111 : var_clock = clock_10MHz;
        */

	input clock_50MHz;

	input [2:0] clock_sel;

	

	output var_clock;

	

	reg var_clock;

	wire rco_10MHz, rco_1MHz, rco_100kHz, rco_10kHz, rco_1kHz, rco_100Hz, rco_10Hz, rco_1Hz;

	wire clock_10MHz, clock_1MHz, clock_100kHz, clock_10kHz, clock_1kHz, clock_100Hz, clock_10Hz, clock_1Hz;

	

	pclock #(5) counter_10MHz(clock_50MHz,1'b1,clock_10MHz,rco_10MHz);   // 50MHz to 10MHz

	pclock counter_1MHz(clock_50MHz,rco_10MHz,clock_1MHz,rco_1MHz);      // 10MHz to 1MHz

	pclock counter_100kHz(clock_50MHz,rco_1MHz,clock_100kHz,rco_100kHz); // 1MHz to 100kHz

	pclock counter_10kHz(clock_50MHz,rco_100kHz,clock_10kHz,rco_10kHz);  // 100kHz to 10kHz

	pclock counter_1kHz(clock_50MHz,rco_10kHz,clock_1kHz,rco_1kHz);      // 10kHz to 1kHz

	pclock counter_100Hz(clock_50MHz,rco_1kHz,clock_100Hz,rco_100Hz);    // 1kHz to 100Hz

	pclock counter_10Hz(clock_50MHz,rco_100Hz,clock_10Hz,rco_10Hz);      // 100Hz to 10Hz

	pclock counter_1Hz(clock_50MHz,rco_10Hz,clock_1Hz,rco_1Hz);          // 10Hz to 1Hz

	

	always @ (posedge clock_50MHz)

	case(clock_sel)

	   3'b000 : var_clock = clock_1Hz;

	   3'b001 : var_clock = clock_10Hz;

	   3'b010 : var_clock = clock_100Hz;

	   3'b011 : var_clock = clock_1kHz;

	   3'b100 : var_clock = clock_10kHz;

	   3'b101 : var_clock = clock_100kHz;

	   3'b110 : var_clock = clock_1MHz;

	   3'b111 : var_clock = clock_10MHz;

	   default: var_clock = clock_1Hz;

	endcase



endmodule



module pclock(clk,EN,clk_out,rco_out);

	/* Parameterized clock divider module.  By Douglas Long 11/11/07
 	*   clk -- input clock
 	*   EN  -- clock Enable (active HIGH)
 	*   clk_out -- output clock (divided by NCYCLES)
 	*   rco_out -- ripple carry output (enable higer order clock)
 	*/

	input clk,EN;

	output clk_out,rco_out;

	

	parameter NCYCLES=10;

	

	reg [3:0] count;

	reg clk_out,rco_out;

	

	always @ (posedge clk)

	if(EN)

	   if(count < NCYCLES-1)

		   count = count+4'b0001;

	   else

		   count = 0;

	

	always @ (count,EN)

	begin

		if (count <= (NCYCLES-1)/2)

		   clk_out = 0;

		else

		   clk_out = 1;

		if ((count == NCYCLES-1) & EN)

		   rco_out = 1;

		else

		   rco_out = 0;

	end

	

endmodule
