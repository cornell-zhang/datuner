.NOTPARALLEL:
#
# Indicates our relative path to the top of the project's root directory.
#

SRC_LEVEL = .
LEVEL = $(SRC_LEVEL)/..
#
# Include the Master Makefile that knows how to build all.
#
include ./Makefile.src.config

MY_TOOL_CC    =  $(DATuner_PKG_INSTALL)/bin/mpicxx -g 
MY_TOOL_BUILD = $(DATuner_OBJ)/build
MY_TOOL_BIN   = $(DATuner_OBJ)/bin
MY_TOOL_CPPFLAGS = $(CPPFLAGS)

all ::
	if [ ! -d $(DATuner_OBJ) ]; then mkdir $(DATuner_OBJ) || exit 1; fi
	if [ ! -d $(MY_TOOL_BUILD) ]; then mkdir $(MY_TOOL_BUILD) || exit 1 ; fi
	if [ ! -d $(MY_TOOL_BIN) ]; then mkdir $(MY_TOOL_BIN) || exit 1 ; fi 

include $(SRC_LEVEL)/Makefile.worker
include $(SRC_LEVEL)/Makefile.controller

vpath %.cpp $(SRC_LEVEL)
$(MY_TOOL_BUILD)/%.o :: %.cpp
	if $(MY_TOOL_CC) -c $(MY_TOOL_CPPFLAGS) -MD -MT $@ -MP -MF $(MY_TOOL_BUILD)/$*.Cxxd $< -o $@ ; \
		then mv -f "$(MY_TOOL_BUILD)/$*.Cxxd" "$(MY_TOOL_BUILD)/$*.d" ; \
		else rm -f "$(MY_TOOL_BUILD)/$*.Cxxd" ; exit 1 ; fi

