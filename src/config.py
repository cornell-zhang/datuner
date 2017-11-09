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
  ['EnumParameter', 'sweepparam', ['2', '4', '8', '16', '32', '48', '64', '96', '128']],
]

# whether we are optimizing or sweeping
sweep = True

budget = 4

workspace = '/home/ty252/datuner/workspace'

user = 'ty252'

machines = [
  'zhang-05.ece.cornell.edu',
  'zhang-06.ece.cornell.edu',
  'zhang-07.ece.cornell.edu',
  'zhang-08.ece.cornell.edu'
]

flow = 'quartus'

genfile = 'genVerilogMultiplier.py'

dbtablename = 'multiplier'

overwrite = False

server_address = ('zhang-05.ece.cornell.edu', 10000)
