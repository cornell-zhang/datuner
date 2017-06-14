create_clock -period 14 -name clk [get_ports clk]

set_property BITSTREAM.GENERAL.UNCONSTRAINEDPINS Allow [current_design]

current_instance -quiet
