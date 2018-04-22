import os

designs = [
  'adder',
  'arbiter',
  'bar',
  'cavlc',
  'ctrl',
  'dec',
  'div',
  'hyp',
  'i2c',
  'int2float',
  'log2',
  'max',
  'mem_ctrl',
  'multiplier',
  'priority',
  'router',
  'sin',
  'sqrt',
  'square',
  'voter'
]


for i in designs:
  os.system("abc -c \"read ../" + i + ".blif; strash; compress2rs; if -a -K 6; print_stats; write " + i + "_opt.blif\" >> result.txt")
