APPSOURCES = LogisticRegression.cpp  
EXECUTABLE = logistic_reg.elf

PLATFORM = zc706
SDSFLAGS = -sds-pf ${PLATFORM}  \
           -poll-mode 1 

CC = sds++ ${SDSFLAGS}

CFLAGS = -Wall -O3 -c
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"
LFLAGS = -O3

OBJECTS := $(APPSOURCES:.cpp=.o)
DEPS := $(OBJECTS:.o=.d)

.PHONY: all

all: ${EXECUTABLE}

${EXECUTABLE}: ${OBJECTS}
	${CC} ${LFLAGS} ${OBJECTS} -o $@ 

-include ${DEPS}

%.o: %.cpp
	${CC} ${CFLAGS} $< -o $@

csim:
	vivado_hls csim.tcl

sw:
	g++ -I/scratch/xilinx/Vivado_HLS/2017.2/include/ -O3 LogisticRegression.cpp -o logistic
	./logistic 

clean:
	${RM} ${EXECUTABLE} ${OBJECTS} 

ultraclean: clean
	${RM} ${EXECUTABLE}.bit 
	${RM} -rf _sds sd_card
