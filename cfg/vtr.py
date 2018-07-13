space = [
  ['EnumParameter', 'resyn', ['on', 'off']],
  ['EnumParameter', 'resyn2', ['on', 'off']],
  ['EnumParameter', 'resyn3', ['on', 'off']],
  ['EnumParameter', 'alpha_clustering', [ '0', '0.1', '0.2', '0.3', '0.4', '0.5','0.6', '0.7', '0.8', '0.9', '1' ]],
  ['EnumParameter', 'timing_tradeoff', [ '0', '0.1', '0.2', '0.3', '0.4', '0.5','0.6', '0.7', '0.8', '0.9', '1' ]],
  ['EnumParameter', 'max_router_iterations', [ '10', '20', '30', '40', '50', '60', '70', '80', '90', '100' ]]
]

designdir = # PATH_TO_DESIGN_FILE (e.g. '$DATUNER_HOME/designs/vtr/stereovision0.v')

archdir = # PATH_TO_ARCHITECTURE_FILE (e.g. '$DATUNER_HOME/archs/vtr/k6_frac_N10_mem32K_40nm.xml') 

target_cp = # TARGET_CLOCK_PERIOD_IN_NANOSECONDS (e.g. '2.0')

vtrpath = # PATH_TO_VTR_FLOW_FOLDER (i.e. '.../vtr_release/vtr_flow')

workspace = # PATH_TO_WORKSPACE_FOLDER

machines = # [ MACHINE_ADDR_1, MACHINE_ADDR_2, ... ]

server_address = # ( SERVER_ADDR, PORT_NUMBER )
