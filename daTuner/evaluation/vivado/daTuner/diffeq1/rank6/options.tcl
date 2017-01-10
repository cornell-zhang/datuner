opt_design -directive Default
place_design -directive AltSpreadLogic_medium
phys_opt_design -fanout_opt -placement_opt -critical_cell_opt -rewire
route_design -directive HigherDelayCost
