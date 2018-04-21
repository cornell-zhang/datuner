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
  ['EnumParameter', 'fit_tdc', ['on', 'off']]
]

designdir = # PATH_TO_DESIGN_FOLDER

top_module = # TOP_MODULE

workspace = # PATH_TO_WORKSPACE_FOLDER

machines = # [ MACHINE_ADDR_1, MACHINE_ADDR_2, ... ]

server_address = # ( SERVER_ADDR, PORT_NUMBER )
