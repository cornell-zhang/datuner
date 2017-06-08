.NOTPARALLEL:

PKG_LEVEL = ..
include $(PKG_LEVEL)/Makefile.pkg.common

#https://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz
mpichVersion := 3.2
PkgBuildDir = $(DATuner_PKG_BUILD)/mpich
PkgTarBall = mpich-$(mpichVersion).tar.gz
mpichBuildDir = $(PkgBuildDir)/build
mpichSrcDir = $(PkgBuildDir)/mpich-$(mpichVersion)

## Rules
all:: download-mpich config-mpich make-mpich

#=== Build mpich ===#

download-mpich: $(PkgBuildDir)/$(PkgTarBall) 

$(PkgBuildDir)/$(PkgTarBall): $(PkgBuildDir)/.dir
	cd $(PkgBuildDir); \
		wget https://www.mpich.org/static/downloads/$(mpichVersion)/$(PkgTarBall);
	@touch $@

config-mpich: $(mpichBuildDir)/config.status 

$(mpichBuildDir)/config.status: $(PkgBuildDir)/.unpacked $(mpichBuildDir)/.dir $(mpichSrcDir)/configure
	cd $(mpichBuildDir); \
	$(mpichSrcDir)/configure --prefix=$(DATuner_PKG_INSTALL) --disable-fortran; 

make-mpich:: $(mpichBuildDir)/mpich

$(mpichBuildDir)/mpich:
	cd $(mpichBuildDir); \
	make; \
	make install;
