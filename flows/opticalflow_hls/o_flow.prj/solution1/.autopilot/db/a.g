#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/sx233/datuner/src/opticalflow_hls/o_flow.prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
