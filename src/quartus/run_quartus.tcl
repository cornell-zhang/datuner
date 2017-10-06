set topmodule "adder"
set srcdir "./design"

load_package flow

proc make_all_pins_virtual {} {

    execute_module -tool map

    set name_ids [get_names -filter * -node_type pin]

    foreach_in_collection name_id $name_ids {
        set pin_name [get_name_info -info full_path $name_id]
        post_message "Making VIRTUAL_PIN assignment to $pin_name"
        set_instance_assignment -to $pin_name -name VIRTUAL_PIN ON
    }
    export_assignments
}

# clean up files from the previous run
exec rm -f $srcdir/$topmodule.qpf
exec rm -f $srcdir/$topmodule.qsf

project_new $srcdir/$topmodule -overwrite
post_message -type info "Setting params"
set_parameter -name SWEEPPARAM
make_all_pins_virtual
source ../options.tcl
execute_module -tool sta -args "--sdc=timing.sdc"
exec cp $topmodule.sta.summary ../sta.summary
exec cp $topmodule.fit.summary ../fit.summary
project_close
