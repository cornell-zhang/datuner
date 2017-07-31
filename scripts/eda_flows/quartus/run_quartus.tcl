set design BENCH
set topmodule TOPMODULE
set srcdir DESIGN_PATH
set workdir WORKDIR_HOLDER
set outputDir $workdir/output
file delete -force $outputDir
file mkdir $outputDir

load_package flow
project_new $srcdir/$topmodule -overwrite
source $workdir/options.tcl
project_close
