opt_design -directive ExploreSequentialArea
place_design -directive ExtraNetDelay_medium
phys_opt_design -fanout_opt -retime -rewire
route_design -directive HigherDelayCost
