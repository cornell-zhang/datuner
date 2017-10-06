space = [
  ['EnumParameter', 'map_effort', ['auto']],
  ['EnumParameter', 'map_ignore_carry_buffers', ['off']],
  ['EnumParameter', 'map_ignore_cascade_buffers', ['off']],
  ['EnumParameter', 'map_optimize', ['balanced']],
  ['EnumParameter', 'map_state_machine_encoding', ['auto']],
  ['EnumParameter', 'fit_effort', ['fast']],
  ['EnumParameter', 'fit_one_fit_attempt', ['on']],
  ['EnumParameter', 'fit_optimize_io_register_for_timing', ['off']],
  ['EnumParameter', 'fit_pack_register', ['auto']],
  ['EnumParameter', 'fit_tdc', ['off']],
  ['EnumParameter', 'sweepparam', ['8', '16', '32', '64']],
]

# whether we are optimizing or sweeping
sweep = 1

budget = 4

workspace = '/home/ty252/datuner/workspace'

machines = [
  'ty252@zhang-05.ece.cornell.edu',
  'ty252@zhang-06.ece.cornell.edu',
  'ty252@zhang-07.ece.cornell.edu',
  'ty252@zhang-08.ece.cornell.edu'
]

flow = 'quartus'

server_address = ('zhang-05.ece.cornell.edu', 9999)
