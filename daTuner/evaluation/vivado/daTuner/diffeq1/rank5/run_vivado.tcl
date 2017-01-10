set design diffeq1
set type daTuner
set path /home/xuchang/nas/project/daTuner/evaluation/vivado//daTuner/diffeq1
set srcdir /home/xuchang/nas/project/daTuner/evaluation/vivado_design//$design/
set rank 5
set workdir $path/rank$rank/
set outputDir $workdir/output
file delete -force $outputDir
file mkdir $outputDir

#open_checkpoint $srcdir/postlogicopt.dcp
read_xdc $workdir/design.xdc

read_verilog $srcdir/$design.v

synth_design
source $workdir/options.tcl

write_checkpoint -force $outputDir/post_route
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file $outputDir/post_route_timing.rpt
report_clock_utilization -file $outputDir/clock_util.rpt
report_utilization -file $outputDir/post_route_util.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt
write_verilog -force $outputDir/cpu_impl_netlist.v
write_xdc -no_fixed_only -force $outputDir/cpu_impl.xdc
