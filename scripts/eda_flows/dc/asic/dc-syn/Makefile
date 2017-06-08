#=======================================================================
# UCB VLSI FLOW: Makefile for dc-syn & fm-ver
#-----------------------------------------------------------------------
# Yunsup Lee (yunsup@cs.berkeley.edu)
#
# This makefile will use Synopsys Design Compiler to synthesize
# your RTL into a gate-level verilog netlist.
# This makefile will use Synopsys Formality to verify
# generated gate-level verilog netlist against your RTL implementation.
#

UCB_VLSI_HOME = PATH_TO_CELL_LIBRARY
UCB_STDCELLS = saed-32nm-synopsys-cells

include ../Makefrag

# We don't derate the clock period anymore
# dc_clock_period = 0$(shell echo "scale=4; ${clock_period}*0.9" | bc)
dc_clock_period = $(clock_period)

default: all

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

basedir  = ../..

pymtl_search_dir = ../$(basedir)/$(pymtl_build_dir)

# Verilog sources (do not include test harness!)

vsrcs = $(basedir)/$(pymtl_build_dir)/$(vsrc)

# VCD

vcdsrc = $(basedir)/$(pymtl_build_dir)/$(vcd)

# Specify toplevel verilog module

toplevel = $(basename $(notdir $(vsrc)))

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

dc_exec         := dc_shell-xg-t -64bit -topographical_mode
fm_exec         := fm_shell -64bit
build_suffix    := $(shell date +%Y-%m-%d_%H-%M)
build_dc_dir    := build-dc-$(build_suffix)
cur_build_dc_dir:= current-dc
reports_dir     := reports
results_dir     := results
log_dir         := log
stdcells_dir    := $(UCB_VLSI_HOME)/$(UCB_STDCELLS)

dc_timestamp    := $(cur_build_dc_dir)/timestamp
dc_ddc          := $(cur_build_dc_dir)/$(results_dir)/$(toplevel).mapped.ddc
fm_rpt          := $(cur_build_dc_dir)/$(reports_dir)/$(toplevel).fmv_verify.rpt

vars_tcl        := rm_setup/common_setup.tcl rm_setup/dc_setup.tcl rm_setup/dc_setup_filenames.tcl
makegen_tcl     := make_generated_vars.tcl

dc_tcl          := rm_dc_scripts/dc.tcl
dc_misc_tcl     := rm_dc_scripts/find_regs.tcl
fm_tcl          := rm_dc_scripts/fm.tcl
constraints_tcl := constraints.tcl

#TODO: add clock gated cells?
#set TARGET_LIBRARY_FILES        "cells.db cells_cg.db";\n \

vars = \
	set DESIGN_NAME                 "$(toplevel)";\n \
	set ADDITIONAL_SEARCH_PATH      "$(stdcells_dir) $(pymtl_search_dir)";\n \
	set TARGET_LIBRARY_FILES        "$(stdcells_dir)/cells.db";\n \
	set MW_REFERENCE_LIB_DIRS       "$(stdcells_dir)/cells.fr";\n \
	set TECH_FILE                   "$(stdcells_dir)/cells.tf";\n \
	set MAP_FILE                    "$(stdcells_dir)/tech2itf.map";\n \
	set TLUPLUS_MAX_FILE            "$(stdcells_dir)/cells-max.tluplus";\n \
	set TLUPLUS_MIN_FILE            "$(stdcells_dir)/cells-min.tluplus";\n \
	set ALIB_DIR                    "$(stdcells_dir)/alib";\n \
	set RTL_SOURCE_FILES            "$(notdir $(vsrcs))";\n \
	set DCRM_CONSTRAINTS_INPUT_FILE "constraints.tcl";\n \
	set REPORTS_DIR                 "$(reports_dir)";\n \
	set RESULTS_DIR                 "$(results_dir)";\n \
	set CLOCK_PERIOD                "$(dc_clock_period)";\n \

define new-build-dir-cmds
	mkdir $(build_dc_dir)
	rm -f $(cur_build_dc_dir)
	ln -s $(build_dc_dir) $(cur_build_dc_dir)
	cp $(dc_tcl) $(dc_misc_tcl) $(constraints_tcl) $(vars_tcl) $(cur_build_dc_dir)
	echo -e '$(vars)' > $(cur_build_dc_dir)/$(makegen_tcl)
	date > $(dc_timestamp)
endef

new-build-dir:
	$(new-build-dir-cmds)

$(dc_timestamp): Makefile ../Makefrag $(vsrcs) $(vars_tcl) $(constraints_tcl) $(dc_tcl) $(dc_misc_tcl)
	$(new-build-dir-cmds)

$(dc_ddc): $(dc_timestamp)
#	vcd2saif -64 -input $(vcdsrc) -output current-dc/rtl-sim.saif
	cd $(cur_build_dc_dir); \
	cp ../../Makefrag .; \
	mkdir -p $(log_dir); \
	$(dc_exec) -f $(notdir $(dc_tcl)) | tee $(log_dir)/dc.log; \
	cd ..

#	sdfcorrect.py results/$(toplevel).mapped.sdf results/$(toplevel).mapped.corrected.sdf \

dc: $(dc_ddc)

$(fm_rpt): $(dc_ddc) $(fm_tcl)
	cp $(fm_tcl) $(constraints_tcl) $(vars_tcl) $(cur_build_dc_dir)
	echo -e '$(vars)' > $(cur_build_dc_dir)/$(makegen_tcl)
	cd $(cur_build_dc_dir); \
	mkdir -p $(log_dir); \
	$(fm_exec) -f $(notdir $(fm_tcl)) | tee $(log_dir)/fm.log; \
	cd ..

fm: $(fm_rpt)

#--------------------------------------------------------------------
# Default make target
#--------------------------------------------------------------------

.PHONY: dc fm

all: dc

#--------------------------------------------------------------------
# Clean up
#--------------------------------------------------------------------

junk +=

clean:
	rm -rf build* current* $(junk) *~ \#*
