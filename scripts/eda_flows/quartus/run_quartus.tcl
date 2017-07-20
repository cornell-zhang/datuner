set design BENCH
set topmodule TOPMODULE
set srcdir DESIGN_PATH
set workdir WORKDIR_HOLDER
set outputDir $workdir/output
file delete -force $outputDir
file mkdir $outputDir

load_package flow
project_new /work/zhang/users/eu49/datuner/releases/Linux_x86_64/scripts/eda_flows/quartus/design/processor/lab5_top -overwrite

source $workdir/options.tcl
project_close
