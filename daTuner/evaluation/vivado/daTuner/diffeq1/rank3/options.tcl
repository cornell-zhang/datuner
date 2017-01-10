opt_design -directive AddRemap
place_design -directive AltSpreadLogic_low
phys_opt_design -fanout_opt -critical_cell_opt -rewire -critical_pin_opt
route_design -directive Default
