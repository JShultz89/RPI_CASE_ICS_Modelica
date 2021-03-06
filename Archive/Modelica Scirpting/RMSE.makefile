# Makefile generated by OpenModelica

# Dynamic loading uses -O0 by default
SIM_OR_DYNLOAD_OPT_LEVEL=-O0
CC=gcc
CXX=g++
LINK=g++ -shared -Xlinker --export-all-symbols
EXEEXT=.exe
DLLEXT=.dll
DEBUG_FLAGS=
CFLAGS= -I"D:/Application/OpenModelica1.9.1//include/omc/c"  $(DEBUG_FLAGS) ${SIM_OR_DYNLOAD_OPT_LEVEL} -falign-functions -msse2 -mfpmath=sse ${MODELICAUSERCFLAGS} 
LDFLAGS= -L"D:/Application/OpenModelica1.9.1//lib/omc" -Wl,-rpath,'D:/Application/OpenModelica1.9.1//lib/omc'  -lregex -lexpat -lgc -lpthread -fopenmp -loleaut32  -lOpenModelicaRuntimeC -lgc -lexpat -lregex -static-libgcc -luuid -loleaut32 -lole32 -lws2_32 -lsundials_kinsol -lsundials_nvecserial -lipopt -lcoinmumps -lpthread -lm -lgfortranbegin -lgfortran -lmingw32 -lgcc_eh -lmoldname -lmingwex -lmsvcrt -luser32 -lkernel32 -ladvapi32 -lshell32 -llapack-mingw -lcminpack -ltmglib-mingw -lblas-mingw -lf2c
PERL=perl
MAINFILE=RMSE.c

.PHONY: RMSE
RMSE: $(MAINFILE) RMSE.h RMSE_records.c
	 $(CC) $(CFLAGS) -c -o RMSE.o $(MAINFILE)
	 $(CC) $(CFLAGS) -c -o RMSE_records.o RMSE_records.c
	 $(LINK) -o RMSE$(DLLEXT) RMSE.o RMSE_records.o  $(CFLAGS) $(LDFLAGS) -lm