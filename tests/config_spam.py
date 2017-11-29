space = [
  ['EnumParameter', 'INT_WIDTH_FEATURE', [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]],
  ['EnumParameter', 'FRA_WIDTH_FEATURE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24]],
#  ['EnumParameter', 'INT_WIDTH_DATA', [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]],
#  ['EnumParameter', 'FRA_WIDTH_DATA', [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]],
  ['EnumParameter', 'INT_WIDTH_TMP', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24]],
  ['EnumParameter', 'FRA_WIDTH_TMP', [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]],
#  ['EnumParameter', 'INT_WIDTH_DATA2', [58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68]],
  ['EnumParameter', 'INT_WIDTH_LABEL', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]],
 # ['EnumParameter', 'INT_WIDTH_LABEL2', [1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]]
]

budget = 128

workspace = '/home/sx233/datuner/build_test/test'

machines = [
  'sx233@zhang-08.ece.cornell.edu',
  'sx233@zhang-05.ece.cornell.edu',
  'sx233@zhang-03.ece.cornell.edu',
  'sx233@zhang-11.ece.cornell.edu'
]

flow = 'vivado_hls_spam'

server_address = ('zhang-08.ece.cornell.edu', 10000)
