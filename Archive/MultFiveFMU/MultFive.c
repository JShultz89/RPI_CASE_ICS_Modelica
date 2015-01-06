/* Main Simulation File */
/* Simulation code for MultFive generated by the OpenModelica Compiler 1.9.1 Beta2 (r19512) (RML version). */

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

#include "MultFive_functions.h"
#include "MultFive_model.h"
#include "MultFive_literals.h"



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


#define prefixedName_performSimulation MultFive_performSimulation
#include <simulation/solver/perform_simulation.c>

/* dummy VARINFO and FILEINFO */
const FILE_INFO dummyFILE_INFO = omc_dummyFileInfo;
const VAR_INFO dummyVAR_INFO = omc_dummyVarInfo;
#ifdef __cplusplus
extern "C" {
#endif
#ifdef _OMC_MEASURE_TIME
int measure_time_flag = 1;
#else
int measure_time_flag = 0;
#endif

int MultFive_input_function(DATA *data)
{
  $PInput = data->simulationInfo.inputVars[0];
  return 0;
}

int MultFive_input_function_init(DATA *data)
{
  $P$ATTRIBUTE$PInput.start = data->simulationInfo.inputVars[0];
  return 0;
}

int MultFive_output_function(DATA *data)
{
  data->simulationInfo.outputVars[0] = $POutput;
  return 0;
}


/*
 equation index: 2
 type: SIMPLE_ASSIGN
 der($dummy) = 0.0
 */
void MultFive_eqFunction_2(DATA *data)
{
  const int equationIndexes[2] = {1,2};
  /* Dummy Line */
  $P$DER$P$dummy = 0.0;
}
/*
 equation index: 3
 type: SIMPLE_ASSIGN
 Output = 5.0 * Input
 */
void MultFive_eqFunction_3(DATA *data)
{
  const int equationIndexes[2] = {1,3};
  $POutput = (5.0 * $PInput);
}


int MultFive_functionDAE(DATA *data)
{
  data->simulationInfo.needToIterate = 0;
  data->simulationInfo.discreteCall = 1;
  MultFive_eqFunction_2(data);
  MultFive_eqFunction_3(data);
  
  return 0;
}


/* forwarded equations */
extern void MultFive_eqFunction_2(DATA* data);

static void functionODE_system0(DATA *data)
{
  #ifdef _OMC_MEASURE_TIME
    SIM_PROF_TICK_EQEXT(2);
  #endif
  MultFive_eqFunction_2(data);
  #ifdef _OMC_MEASURE_TIME
    SIM_PROF_ACC_EQEXT(2);
  #endif
}

int MultFive_functionODE(DATA *data)
{
#ifdef _OMC_MEASURE_TIME
  rt_tick(SIM_TIMER_FUNCTION_ODE);
#endif

  
  data->simulationInfo.discreteCall = 0;
  functionODE_system0(data);
#ifdef _OMC_MEASURE_TIME
  rt_accumulate(SIM_TIMER_FUNCTION_ODE);
#endif

  return 0;
}

#include <simulation/solver/simulation_inline_solver.h>
const char *_omc_force_solver=_OMC_FORCE_SOLVER;
const int inline_work_states_ndims=_OMC_SOLVER_WORK_STATES_NDIMS;
int MultFive_functionODE_inline(DATA* data, double stepSize)
{
  return 0;
}

/* forward the main in the simulation runtime */
extern int _main_SimulationRuntime(int argc, char**argv, DATA *data);

#include "MultFive_12jac.h"
#include "MultFive_13opt.h"
extern void MultFive_callExternalObjectConstructors(DATA *data);
extern void MultFive_callExternalObjectDestructors(DATA *_data);
extern void MultFive_initialNonLinearSystem(NONLINEAR_SYSTEM_DATA *data);
extern void MultFive_initialLinearSystem(LINEAR_SYSTEM_DATA *data);
extern void MultFive_initialMixedSystem(MIXED_SYSTEM_DATA *data);
extern void MultFive_initializeStateSets(STATE_SET_DATA* statesetData, DATA *data);
extern int MultFive_functionAlgebraics(DATA *data);
extern int MultFive_function_storeDelayed(DATA *data);
extern int MultFive_updateBoundVariableAttributes(DATA *data);
extern const char* MultFive_initialResidualDescription(int);
extern int MultFive_initial_residual(DATA *data, double* initialResiduals);
extern int MultFive_functionInitialEquations(DATA *data);
extern int MultFive_updateBoundParameters(DATA *data);
extern int MultFive_checkForAsserts(DATA *data);
extern int MultFive_function_ZeroCrossings(DATA *data, double* gout, double* t);
extern int MultFive_function_updateRelations(DATA *data, int evalZeroCross);
extern int MultFive_checkForDiscreteChanges(DATA *data);
extern const char* MultFive_zeroCrossingDescription(int i, int **out_EquationIndexes);
extern const char* MultFive_relationDescription(int i);
extern void MultFive_function_initSample(DATA *data);
extern int MultFive_initialAnalyticJacobianG(void* data);
extern int MultFive_initialAnalyticJacobianA(void* data);
extern int MultFive_initialAnalyticJacobianB(void* data);
extern int MultFive_initialAnalyticJacobianC(void* data);
extern int MultFive_initialAnalyticJacobianD(void* data);
extern int MultFive_functionJacG_column(void* data);
extern int MultFive_functionJacA_column(void* data);
extern int MultFive_functionJacB_column(void* data);
extern int MultFive_functionJacC_column(void* data);
extern int MultFive_functionJacD_column(void* data);
extern const char* MultFive_linear_model_frame(void);
extern int MultFive_mayer(DATA* data, modelica_real* res);
extern int MultFive_lagrange(DATA* data, modelica_real* res);
extern int MultFive_pickUpBoundsForInputsInOptimization(DATA* data, modelica_real* min, modelica_real* max, modelica_real*nominal, modelica_boolean *useNominal, char ** name, modelica_real * start, modelica_real * startTimeOpt);

struct OpenModelicaGeneratedFunctionCallbacks MultFive_callback = {
   (int (*)(DATA *, void *)) MultFive_performSimulation,
   MultFive_callExternalObjectConstructors,
   MultFive_callExternalObjectDestructors,
   MultFive_initialNonLinearSystem,
   MultFive_initialLinearSystem,
   MultFive_initialMixedSystem,
   MultFive_initializeStateSets,
   MultFive_functionODE,
   MultFive_functionAlgebraics,
   MultFive_functionDAE,
   MultFive_input_function,
   MultFive_input_function_init,
   MultFive_output_function,
   MultFive_function_storeDelayed,
   MultFive_functionODE_inline,
   MultFive_updateBoundVariableAttributes,
   MultFive_initialResidualDescription,
   MultFive_initial_residual,
   1 /* useSymbolicInitialization */,
   0 /* useHomotopy */,
   MultFive_functionInitialEquations,
   MultFive_updateBoundParameters,
   MultFive_checkForAsserts,
   MultFive_function_ZeroCrossings,
   MultFive_function_updateRelations,
   MultFive_checkForDiscreteChanges,
   MultFive_zeroCrossingDescription,
   MultFive_relationDescription,
   MultFive_function_initSample,
   MultFive_INDEX_JAC_G,
   MultFive_INDEX_JAC_A,
   MultFive_INDEX_JAC_B,
   MultFive_INDEX_JAC_C,
   MultFive_INDEX_JAC_D,
   MultFive_initialAnalyticJacobianG,
   MultFive_initialAnalyticJacobianA,
   MultFive_initialAnalyticJacobianB,
   MultFive_initialAnalyticJacobianC,
   MultFive_initialAnalyticJacobianD,
   MultFive_functionJacG_column,
   MultFive_functionJacA_column,
   MultFive_functionJacB_column,
   MultFive_functionJacC_column,
   MultFive_functionJacD_column,
   MultFive_linear_model_frame,
   MultFive_mayer,
   MultFive_lagrange,
   MultFive_pickUpBoundsForInputsInOptimization

};

void MultFive_setupDataStruc(DATA *data)
{
  assertStreamPrint(threadData,0!=data, "Error while initialize Data");
  data->callback = &MultFive_callback;
  data->modelData.modelName = "MultFive";
  data->modelData.modelFilePrefix = "MultFive";
  data->modelData.modelDir = "";
  data->modelData.modelGUID = "{62bfd85e-2fbd-4cd6-b1d4-f33804744635}";
  #ifdef OPENMODELICA_XML_FROM_FILE_AT_RUNTIME
  data->modelData.initXMLData = NULL;
  data->modelData.modelDataXml.infoXMLData = NULL;
  #else
  data->modelData.initXMLData =
  #include "MultFive_init.c"
  ;
  data->modelData.modelDataXml.infoXMLData =
  #include "MultFive_info.c"
  ;
  #endif
  
  data->modelData.nStates = 1;
  data->modelData.nVariablesReal = 2*1+2+0;
  data->modelData.nDiscreteReal = 0;
  data->modelData.nVariablesInteger = 0;
  data->modelData.nVariablesBoolean = 0;
  data->modelData.nVariablesString = 0;
  data->modelData.nParametersReal = 0;
  data->modelData.nParametersInteger = 0;
  data->modelData.nParametersBoolean = 0;
  data->modelData.nParametersString = 0;
  data->modelData.nInputVars = 1;
  data->modelData.nOutputVars = 1;
  data->modelData.nJacobians = 5;
  
  data->modelData.nAliasReal = 0;
  data->modelData.nAliasInteger = 0;
  data->modelData.nAliasBoolean = 0;
  data->modelData.nAliasString = 0;
  
  data->modelData.nZeroCrossings = 0;
  data->modelData.nSamples = 0;
  data->modelData.nRelations = 0;
  data->modelData.nMathEvents = 0;
  data->modelData.nInitEquations = 0;
  data->modelData.nInitAlgorithms = 0;
  data->modelData.nInitResiduals = 0;    /* data->modelData.nInitEquations + data->modelData.nInitAlgorithms */
  data->modelData.nExtObjs = 0;
  data->modelData.modelDataXml.fileName = "MultFive_info.xml";
  data->modelData.modelDataXml.nFunctions = 0;
  data->modelData.modelDataXml.nProfileBlocks = 0;
  data->modelData.modelDataXml.nEquations = 4;
  data->modelData.nMixedSystems = 0;
  data->modelData.nLinearSystems = 0;
  data->modelData.nNonLinearSystems = 0;
  data->modelData.nStateSets = 0;
  data->modelData.nInlineVars = 0;
  data->modelData.nOptimizeConstraints = 0;
  
  data->modelData.nDelayExpressions = 0;
  
}

#ifdef __cplusplus
}
#endif

static int rml_execution_failed()
{
  fflush(NULL);
  fprintf(stderr, "Execution failed!\n");
  fflush(NULL);
  return 1;
}

#if defined(threadData)
#undef threadData
#endif
/* call the simulation runtime main from our main! */
int main(int argc, char**argv)
{
  int res;
  DATA simulation_data;
  MMC_INIT();omc_alloc_interface.init();
  {
    MMC_TRY_TOP()
  
    MMC_TRY_STACK()
  
    MultFive_setupDataStruc(&simulation_data);
    simulation_data.threadData = threadData;
    res = _main_SimulationRuntime(argc, argv, &simulation_data);
    
    MMC_ELSE()
    rml_execution_failed();
    fprintf(stderr, "Stack overflow detected and was not caught.\nSend us a bug report at https://trac.openmodelica.org/OpenModelica/newticket\n    Include the following trace:\n");
    printStacktraceMessages();
    fflush(NULL);
    return 1;
    MMC_CATCH_STACK()
    
    MMC_CATCH_TOP(return rml_execution_failed());
  }

  fflush(NULL);
  EXIT(res);
  return res;
}

