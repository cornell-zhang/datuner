.NOTPARALLEL:

PKG_LEVEL = ..
include $(PKG_LEVEL)/Makefile.pkg.common

PyVersion := 2.7.5
PkgBuildDir = $(DATuner_PKG_BUILD)/python
PkgTarBall = Python-$(PyVersion).tgz
PythonBuildDir = $(PkgBuildDir)/build
PythonSrcDir = $(PkgBuildDir)/Python-$(PyVersion)
PythonInstallDir = $(PkgBuildDir)/install

## Rules
all:: download-python config-python make-python install-OpenTuner

#=== Build Python ===#

download-python: $(PkgBuildDir)/$(PkgTarBall) 

$(PkgBuildDir)/$(PkgTarBall): $(PkgBuildDir)/.dir
	cd $(PkgBuildDir); \
	wget https://www.python.org/ftp/python/$(PyVersion)/$(PkgTarBall); 
	@touch $@

config-python: $(PythonBuildDir)/config.status 

$(PythonBuildDir)/config.status: $(PkgBuildDir)/.unpacked $(PythonBuildDir)/.dir $(PythonSrcDir)/configure $(PythonInstallDir)/.dir
	cd $(PythonBuildDir); \
	$(PythonSrcDir)/configure --prefix=$(PythonInstallDir) --enable-shared; 

make-python:: $(PythonBuildDir)/python

$(PythonBuildDir)/python:
	cd $(PythonBuildDir); \
	make; \
	make install;

#=== Install OpenTuner ===#

pip_status = $(shell if [ -n `which pip` ]; then echo "exist"; else echo "notexist"; fi;)

install-OpenTuner:
	cd $(PythonInstallDir)/bin; \
	export LD_LIBRARY_PATH=$(PythonInstallDir)/lib; \
	wget https://bootstrap.pypa.io/get-pip.py; \
	./python get-pip.py; \
	./pip install opentuner;
