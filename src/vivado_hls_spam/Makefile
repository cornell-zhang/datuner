APPSOURCES = LogisticRegression.cpp  LogisticRegression_accel.cpp
EXECUTABLE = logistic_reg.elf

PLATFORM = zc706
SDSFLAGS = -sds-pf ${PLATFORM} -sds-hw logisticreg_accel LogisticRegression_accel.cpp -sds-end -clkid 3  \
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
	g++ -O3 -I/scratch/xilinx/Vivado_HLS/2017.2/include/ LogisticRegression.cpp LogisticRegression_accel.cpp -o logistic
	./logistic 

clean:
	${RM} ${EXECUTABLE} ${OBJECTS} 

ultraclean: clean
	${RM} ${EXECUTABLE}.bit 
	${RM} -rf _sds sd_card
