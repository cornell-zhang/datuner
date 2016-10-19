
MY_TOOLS_BIN = ./bin

MY_TOOLS_SRC = ./src

MY_TOOLS_VPATH = $(MY_TOOLS_SRC)
MY_TOOLS_INCL = -I /home/changx/opt/Python/include/python2.7
#$(foreach DIR, $(MY_TOOLS_DIR), -I$(MY_TOOLS_SRC)/$(DIR)) \

MY_TOOLS_CCFLAGS = -static
#-ansi -Wreorder -Wformat -Wunused -Wstrict-aliasing -fopenmp

MY_TOOLS_LDFLAGS = -lm -lpthread -fopenmp -L. -lstdc++ -ldl -lutil \
									 -L/home/changx/opt/Python/lib -lpython2.7

vpath %.cpp $(MY_TOOLS_VPATH)


ifneq ($(build), debug)
MY_TOOLS_POSTFIX = .exe
MY_TOOLS_BUILD = ./build
MY_TOOLS_CC = mpicxx -g -O3 #-static-libgcc  #-DNDEBUG #g++ -O3 #-mtune=core2 -mfpmath=sse -msse2

else
MY_TOOLS_POSTFIX = .debug
MY_TOOLS_BUILD = ./debug
MY_TOOLS_CC = mpicxx -g #-static-libgcc
endif


all ::
	if [ ! -d $(MY_TOOLS_BUILD) ]; then mkdir $(MY_TOOLS_BUILD) || exit 1 ; fi
	if [ ! -d $(MY_TOOLS_BIN) ]; then mkdir $(MY_TOOLS_BIN) || exit 1 ; fi

include Makefile.worker 
include Makefile.master
$(MY_TOOLS_BUILD)/%.o :: %.cpp
	if $(MY_TOOLS_CC) -c $(MY_TOOLS_INCL) $(MY_TOOLS_CCFLAGS) -MD -MT $@ -MP -MF $(MY_TOOLS_BUILD)/$*.CXXd $< -o $@ ; \
		then mv -f "$(MY_TOOLS_BUILD)/$*.CXXd" "$(MY_TOOLS_BUILD)/$*.d" ; \
		else rm -f "$(MY_TOOLS_BUILD)/$*.CXXd" ; exit 1 ; fi
