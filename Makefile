# -*- MakeFile -*- 
#======================================================================
# Makefile
#======================================================================
# @author : Zhiru Zhang
# @date   : April 4, 2017
# @brief  : Top-level makefile for DATuner.
#

.NOTPARALLEL:

LEVEL = .

include Makefile.config

# Release target: Xilinx
RELEASE_XLNX := 1
# Release target: Altera
#RELEASE_ALTR := 1
# Release target: ASIC
#RELEASE_ASIC := 1

#-------------------------------------------------------------------------------

#=== Directory settings ===#
ifdef PREFIX
  ReleaseDirPrefix = $(PREFIX)/daTuner_release
else
  ReleaseDirPrefix = $(CurrDir)/releases
endif


# Rlease name settings
# RELEASE_NAME := 
# RELEASE_DATE := 
ifdef EXTERN_RELEASE
  ifdef RELEASE_NAME
    ReleaseName := $(RELEASE_NAME)
    ifdef RELEASE_DATE
      ReleaseName := $(ReleaseName)-$(RELEASE_DATE)
    endif
  else
    ReleaseName := release
  endif
else
  ReleaseName := release-dev
endif

ReleaseDir = $(ReleaseDirPrefix)
ReleaseDocDir = $(ReleaseDir)/docs
ReleaseExampleDir = $(ReleaseDir)/examples


ReleaseTargetDir := $(ReleaseDir)/$(OS)_$(ARCH)
ReleaseTargetPkgDir = $(ReleaseTargetDir)/install

# Copy or link
ifdef EXTERN_RELEASE
  INSTALL = cp -f
  INSTALLD = cp -rf

else

  INSTALL = ln -sf
  INSTALLD = ln -sf
endif


#Echo = @echo
Prompt = "[DATuner]"

#=== Release rules ===#

all: build

build: build-pkgs release

build-pkgs:
	$(MAKE) -C pkgs

release:: $(ReleaseDir)/.dir release-DATuner release-docs release-install
	#release-examples
	$(Echo) "$(Prompt) DATuner v$(RELEASE_VERSION) installed under $(ReleaseDir)"

ifdef RELEASE_PKGS
release:: release-pkgs

release::
	-chmod -R o+rx $(ReleaseDir)
endif

ifdef EXTERN_RELEASE
release:: release-examples
release:: post-cleanup
endif

#== Release DATuner ==#
release-DATuner:: install-DATuner  

#ifdef EXTERN_RELEASE
#release-DATuner:: install-DATuner-copyright
#endif

#ifdef EXTERN_RELEASE
#release-DATuner:: install-DATuner-version
#endif

DATuner_BASE_NAME = datuner.py

# Make the host program globally executable
install-DATuner::
	chmod u+x $(DATuner_SRC)/datuner.py

CommonBinDir = $(ReleaseDir)/bin

release-install:: $(ReleaseTargetPkgDir)/.dir
	cp -rf $(DATuner_PKG_INSTALL)/* $(ReleaseTargetPkgDir)/ 
	cp -rf $(DATuner_PKG_PYTHON_INSTALL)/* $(ReleaseTargetPkgDir)/ 

# Release docs
release-docs: 

# Release examples
#release-examples:: $(ReleaseExampleDir)/.dir
#	$(Echo) "$(Prompt) Installing examples ... "
#	cp -rf $(DATuner_SRC)/docs/examples/* $(ReleaseExampleDir)/

# To create other directories, as needed, and timestamp their creation
%/.dir:
	$(Verb) $(MKDIR) $* > /dev/null
	$(Verb) $(DATE) > $@
