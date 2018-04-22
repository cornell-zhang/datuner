set design BENCH
set topmodule TOPMODULE
set srcdir DESIGN_PATH
set workdir WORKDIR_HOLDER
set result_id REVISION

load_package flow
project_new -revision $result_id $srcdir/$topmodule -overwrite
set_global_assignment -name TOP_LEVEL_ENTITY $topmodule
set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CGTFD9E5F35C7
source $workdir/options.tcl
project_close
