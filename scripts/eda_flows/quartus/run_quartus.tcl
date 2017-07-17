load_package flow
project_new ./design/proc/lab5_top -overwrite
#set_global_assignment -name FAMILY Stratix
##set_global_assignment -name DEVICE "EP2C20F484C7"
##set_global_assignment -name BDF_FILE "lab5.bdf"
##set_location_assignment -to clock PIN_L1
source $workdir/options.tcl
project_close
