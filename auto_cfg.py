space = [
  ['EnumParameter', 'resyn', ['on', 'off']],
  ['EnumParameter', 'resyn2', ['on', 'off']],
  ['EnumParameter', 'resyn3', ['on', 'off']],
  ['EnumParameter', 'connection_driven_clustering', [ 'on', 'off' ]],
  ['EnumParameter', 'allow_unrelated_clustering', [ 'on', 'off' ]],
  ['EnumParameter', 'alpha_clustering', ['0.5', '0.55', '0.6','0.65', '0.7', '0.75', '0.8', '0.85', '0.9', '0.95', '1']],
  ['EnumParameter', 'beta_clustering', ['0.25', '0.3', '0.35', '0.4', '0.45', '0.5','0.55', '0.6', '0.65', '0.7', '0.75','0.8']],
  ['EnumParameter', 'cluster_seed_type', [ 'timing', 'max_inputs' ]],
  ['EnumParameter', 'seed', [ '1', '2', '3', '4', '5' ]],
  ['EnumParameter', 'inner_num', ['1', '2', '5', '10', '20', '50']],
  ['EnumParameter', 'alpha_t', ['0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9']],
  ['EnumParameter', 'place_chan_width', ['50',  '76', '100', '126','150']],
  ['EnumParameter', 'timing_tradeoff', ['0.25', '0.3', '0.35', '0.4', '0.45', '0.5','0.55', '0.6', '0.65', '0.7', '0.75','0.8']],
  ['EnumParameter', 'recompute_crit_iter', ['1', '2', '3', '4', '5']],
  ['EnumParameter', 'td_place_exp_first', [ '1', '2', '3', '4', '5' ]],
  ['EnumParameter', 'td_place_exp_last', [ '6', '7', '8', '9', '10' ]],
  ['EnumParameter', 'initial_pres_fac', ['0.0', '0.25','0.5', '0.75', '1.0', '2.0']],
  ['EnumParameter', 'first_iter_pres_fac', ['0.0', '0.25','0.5', '0.75', '1.0', '2.0']],
  ['EnumParameter', 'pres_fac_mult', ['0.8','0.9', '1.0', '1.1', '1.2', '1.3', '1.4', '1.5','1.6']],
  ['EnumParameter', 'acc_fac', ['0.5', '0.6', '0.7', '0.8', '0.9', '1.0', '1.1', '1.2', '1.3', '1.4', '1.5']],
  ['EnumParameter', 'bb_factor', ['1', '2', '3', '4', '5']],
  ['EnumParameter', 'base_cost_type', [ 'demand_only', 'delay_normalized' ]],
  ['EnumParameter', 'bend_cost', ['0.25', '0.3', '0.35', '0.4', '0.45', '0.5','0.55', '0.6', '0.65', '0.7', '0.75','0.8']],
  ['EnumParameter', 'astar_fac', ['0.5', '0.6', '0.7', '0.8', '0.9', '1.0', '1.1', '1.2', '1.3','1.4']],
  ['EnumParameter', 'max_criticality', ['0.5','0.55','0.6','0.65', '0.65','0.7','0.75', '0.8','0.85','0.9','0.95','0.99', '1']]
]

dbfilename = 'results'

dbtablename = 'SS'

designdir = '$DATUNER_HOME/designs/vtr/diffeq1.v'

archdir = '$DATUNER_HOME/archs/vtr/k6_frac_N10_mem32K_40nm.xml'

target_cp = '4.0'

vtrpath = 'vtrpath_holder'

workspace = 'workspace_holder'

machines = [ 'machine_holder' ]

server_address = ( 'server_holder', 12000 )

