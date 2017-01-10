opt_design -directive Default
place_design 
phys_opt_design -critical_cell_opt -critical_pin_opt
route_design -directive Explore
