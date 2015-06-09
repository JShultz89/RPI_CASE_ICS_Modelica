# Makefile generated by OpenModelica

# Simulations use -O3 by default
CC=gcc
CXX=g++
LINK=g++ -shared -Xlinker --export-all-symbols
EXEEXT=.exe
DLLEXT=.dll
CFLAGS_BASED_ON_INIT_FILE=
DEBUG_FLAGS=
CFLAGS=$(CFLAGS_BASED_ON_INIT_FILE) $(DEBUG_FLAGS) ${SIM_OR_DYNLOAD_OPT_LEVEL} -falign-functions -msse2 -mfpmath=sse ${MODELICAUSERCFLAGS}   
CPPFLAGS= -I"D:/Application/OpenModelica1.9.1//include/omc/c" -I. -DOPENMODELICA_XML_FROM_FILE_AT_RUNTIME
LDFLAGS=-L"C:/Users/kenton/Documents/GitHub/RPI_CASE_ICS_Modelica" -L"D:/Application/OpenModelica1.9.1//lib/omc" -L"D:/Application/OpenModelica1.9.1//lib" -Wl,--stack,0x2000000,-rpath,"D:/Application/OpenModelica1.9.1//lib/omc" -Wl,-rpath,"D:/Application/OpenModelica1.9.1//lib"   -lregex -lexpat -lgc -lpthread -fopenmp -loleaut32  -lSimulationRuntimeC -lgc -lexpat -lregex -static-libgcc -luuid -loleaut32 -lole32 -lws2_32 -lsundials_kinsol -lsundials_nvecserial -lipopt -lcoinmumps -lpthread -lm -lgfortranbegin -lgfortran -lmingw32 -lgcc_eh -lmoldname -lmingwex -lmsvcrt -luser32 -lkernel32 -ladvapi32 -lshell32 -llapack-mingw -lcminpack -ltmglib-mingw -lblas-mingw -lf2c -linteractive -lwsock32 -llis -lstdc++ 
MAINFILE=ICSolar.ICS_Skeleton.c
MAINOBJ=ICSolar.ICS_Skeleton.o
CFILES=ICSolar.ICS_Skeleton_functions.c ICSolar.ICS_Skeleton_records.c \
ICSolar.ICS_Skeleton_01exo.c ICSolar.ICS_Skeleton_02nls.c ICSolar.ICS_Skeleton_03lsy.c ICSolar.ICS_Skeleton_04set.c ICSolar.ICS_Skeleton_05evt.c ICSolar.ICS_Skeleton_06inz.c ICSolar.ICS_Skeleton_07dly.c \
ICSolar.ICS_Skeleton_08bnd.c ICSolar.ICS_Skeleton_09alg.c ICSolar.ICS_Skeleton_10asr.c ICSolar.ICS_Skeleton_11mix.c ICSolar.ICS_Skeleton_12jac.c ICSolar.ICS_Skeleton_13opt.c ICSolar.ICS_Skeleton_14lnz.c
OFILES=$(CFILES:.c=.o)
GENERATEDFILES=$(MAINFILE) ICSolar.ICS_Skeleton.makefile ICSolar.ICS_Skeleton_literals.h ICSolar.ICS_Skeleton_functions.h $(CFILES)

.PHONY: omc_main_target clean bundle

# This is to make sure that ICSolar.ICS_Skeleton_*.c are always compiled.
.PHONY: $(CFILES)

omc_main_target: $(MAINOBJ) ICSolar.ICS_Skeleton_functions.h ICSolar.ICS_Skeleton_literals.h $(OFILES)
	$(CC) -I. -o ICSolar.ICS_Skeleton$(EXEEXT) $(MAINOBJ) $(OFILES) $(CPPFLAGS) -L"C:/Users/kenton/Documents/GitHub/RPI_CASE_ICS_Modelica"  -lModelicaStandardTables $(CFLAGS) $(LDFLAGS)
clean:
	@rm -f ICSolar.ICS_Skeleton_records.o $(MAINOBJ)

bundle:
	@tar -cvf ICSolar.ICS_Skeleton_Files.tar $(GENERATEDFILES)