.NOTPARALLEL:

PKG_LEVEL = ..
include $(PKG_LEVEL)/Makefile.pkg.common

PkgBuildDir = $(DATuner_PKG_BUILD)/vtr
PkgTarBall = vtr_release_1.0_full.tar.gz
vtrSrcDir = $(PkgBuildDir)/vtr_release

## Rules
all:: download-vtr make-vtr

#=== Build vtr ===#

download-vtr: $(PkgBuildDir)/$(PkgTarBall) 

$(PkgBuildDir)/$(PkgTarBall): $(PkgBuildDir)/.dir
	cd $(PkgBuildDir); \
		wget http://www.eecg.utoronto.ca/vtr/vtr_release_7.0_full.tar.gz;
	@touch $@

make-vtr:: $(PKG_LEVEL)/.unpacked $(vtrSrcDir)/.dir $(vtrSrcDir)/vtr

$(vtrSrcDir)/vtr:
	cd $(vtrSrcDir); \
	make; 
