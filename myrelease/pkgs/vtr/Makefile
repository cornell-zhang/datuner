.NOTPARALLEL:

PKG_LEVEL = ..
include $(PKG_LEVEL)/Makefile.pkg.common

#https://www.eecg.utoronto.ca/vtr/vtr_release_7.0_full.tar.gz
vtrVersion := 7.0
PkgBuildDir = $(DATuner_PKG_BUILD)/vtr
PkgTarBall = vtr_release_$(vtrVersion)_full.tar.gz
vtrBuildDir = $(PkgBuildDir)/build
vtrSrcDir = $(PkgBuildDir)/vtr-$(vtrVersion)

## Rules
all:: download-vtr unpack-vtr  make-vtr

#=== Build vtr ===#

download-vtr: $(PkgBuildDir)/$(PkgTarBall) 

$(PkgBuildDir)/$(PkgTarBall): $(PkgBuildDir)/.dir
	cd $(PkgBuildDir);
	cp $(PKG_LEVEL)/vtr/$(PkgTarBall) $(PkgBuildDir); 
	

unpack-vtr: $(PkgBuildDir)/.unpacked

make-vtr:: $(vtrBuildDir)/vtr

$(vtrBuildDir)/vtr: $(PkgBuildDir)/.dir
	cd $(PkgBuildDir)/vtr_release; \
	make;

#====Temporary modify VTR Remove later=====#

#=== Install OpenTuner ===#

