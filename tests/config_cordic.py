space = [
  ['EnumParameter', 'INT_WIDTH_THETA', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]],
  ['EnumParameter', 'FRA_WIDTH_THETA', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]],
  ['EnumParameter', 'INT_WIDTH_COS', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]],
  ['EnumParameter', 'FRA_WIDTH_COS', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]],
  ['EnumParameter', 'INT_WIDTH_SIN', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]],
  ['EnumParameter', 'FRA_WIDTH_SIN', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]],
]

budget = 64

workspace = '/home/sx233/datuner/build_test'

machines = [
 # 'sx233@zhang-05.ece.cornell.edu',
  'sx233@zhang-08.ece.cornell.edu'
 # 'sx233@zhang-03.ece.cornell.edu',
 # 'sx233@zhang-11.ece.cornell.edu'
]

flow = 'vivado_hls'

server_address = ('zhang-08.ece.cornell.edu', 10000)
