opt_design -directive ExploreSequentialArea
place_design -directive LateBlockPlacement
phys_opt_design -fanout_opt -placement_opt -critical_pin_opt
route_design -directive Explore
