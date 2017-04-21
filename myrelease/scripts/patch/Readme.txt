1. Add parameter to OpenTuner
Please add the following contents to the beginning of Your_Python/site-packages/opentuner/search/driver.py
or replace Your_Python/site-packages/opentuner/search/driver.py with ./driver.py

argparser.add_argument('--defaultcst',type=float,
                                                 help='specify the default timing constraint for vivado')
argparser.add_argument('--tunecst',type=int,
                                                 help='specify whether tune defaultcst or not')
argparser.add_argument('--rank',type=int,
                                                 help='specify the rank of process')

2. For VTR
Please add ./vpr_my.txt to Your_VTR/vtr_release/vtr_flow/parse/parse_config
Please add ./tune_vtr_flow.pl to the directory: Your_VTR/vtr_release/vtr_flow/scripts
