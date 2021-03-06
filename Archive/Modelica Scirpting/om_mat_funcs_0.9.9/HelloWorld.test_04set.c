/* Initial State Set */
/* Simulation code for HelloWorld.test generated by the OpenModelica Compiler 1.9.1 Beta4 (r22666) (RML version). */

#include "openmodelica.h"
#include "openmodelica_func.h"
#include "simulation_data.h"
#include "simulation/simulation_info_xml.h"
#include "simulation/simulation_runtime.h"
#include "util/omc_error.h"
#include "simulation/solver/model_help.h"
#include "simulation/solver/delay.h"
#include "simulation/solver/linearSystem.h"
#include "simulation/solver/nonlinearSystem.h"
#include "simulation/solver/mixedSystem.h"

#include <assert.h>
#include <string.h>

#include "HelloWorld.test_functions.h"
#include "HelloWorld.test_model.h"
#include "HelloWorld.test_literals.h"




#if defined(HPCOM) && !defined(_OPENMP)
  #error "HPCOM requires OpenMP or the results are wrong"
#endif
#if defined(_OPENMP)
  #include <omp.h>
#else
  /* dummy omp defines */
  #define omp_get_max_threads() 1
#endif

#define threadData data->threadData

#include "HelloWorld.test_11mix.h"
#include "HelloWorld.test_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif
/* funtion initialize state sets */
void HelloWorld_test_initializeStateSets(int nStateSets, STATE_SET_DATA* statesetData, DATA *data)
{
}

#if defined(__cplusplus)
}
#endif

