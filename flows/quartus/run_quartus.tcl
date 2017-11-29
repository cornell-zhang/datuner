set topmodule "badprog"
set srcdir "./design"

load_package flow

# clean up files from the previous run
exec rm -f $srcdir/$topmodule.qpf
exec rm -f $srcdir/$topmodule.qsf

project_new $srcdir/$topmodule -overwrite
source ../options.tcl
execute_module -tool sta -args "--sdc=timing.sdc"
exec cp $topmodule.sta.summary ../sta.summary
exec cp $topmodule.fit.summary ../fit.summary
project_close
