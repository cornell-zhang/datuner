opt_design -directive AddRemap
place_design -directive AltSpreadLogic_low
phys_opt_design -fanout_opt -retime -rewire -critical_pin_opt
route_design -directive Default
