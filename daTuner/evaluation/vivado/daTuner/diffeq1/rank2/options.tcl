opt_design -directive AddRemap
place_design -directive Default
phys_opt_design -critical_cell_opt -rewire -critical_pin_opt
route_design -directive Explore
