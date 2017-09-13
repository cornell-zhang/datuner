space = [
  ['EnumParameter', 'map_effort', ['auto', 'fast']],
  ['EnumParameter', 'map_ignore_carry_buffers', ['on', 'off']],
  ['EnumParameter', 'map_ignore_cascade_buffers', ['on', 'off']],
  ['EnumParameter', 'map_optimize', ['area', 'speed', 'balanced']],
  ['EnumParameter', 'map_state_machine_encoding', ['auto', 'minimal_bits', 'one_hot', 'user_encoded']],
  ['EnumParameter', 'fit_effort', ['standard', 'fast', 'auto']],
  ['EnumParameter', 'fit_one_fit_attempt', ['on', 'off']],
  ['EnumParameter', 'fit_optimize_io_register_for_timing', ['on', 'off']],
  ['EnumParameter', 'fit_pack_register', ['off', 'normal', 'minimize_area', 'minimize_area_with_chains', 'auto']],
  ['EnumParameter', 'fit_tdc', ['on', 'off']],
]

budget = 4

workspace = '/work/zhang/users/liu/datuner/workspace'

machines = [
  'gl387@zhang-08.ece.cornell.edu'
]

flow = 'quartus'

server_address = ('zhang-08.ece.cornell.edu', 10000)
