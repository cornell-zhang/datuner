set design BENCH
set topmodule TOPMODULE
set srcdir DESIGN_PATH
set workdir WORKDIR_HOLDER

load_package flow
project_new $srcdir/$topmodule -overwrite
source $workdir/options.tcl
project_close
