/* Jacobians */
/* Simulation code for HelloWorld.Hello generated by the OpenModelica Compiler 1.9.1 Beta2 (r19512) (RML version). */

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

#include "HelloWorld.Hello_functions.h"
#include "HelloWorld.Hello_model.h"
#include "HelloWorld.Hello_literals.h"



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

#include "HelloWorld.Hello_12jac.h"
int HelloWorld_Hello_initialAnalyticJacobianG(void* inData)
{
  return 1;
}

static void HelloWorld_Hello_initialAnalyticJacobianA_0(DATA* data, int index)
{
  int i;
  /* write index for cref: $Px */
  i = data->simulationInfo.analyticJacobians[index].sparsePattern.leadindex[$Px$pDERA$indexdiff] - 1;
  data->simulationInfo.analyticJacobians[index].sparsePattern.index[i+0] = $Px$pDERA$indexdiffed;
}


int HelloWorld_Hello_initialAnalyticJacobianA(void* inData)
{
  DATA* data = ((DATA*)inData);
  int index = HelloWorld_Hello_INDEX_JAC_A;
  
  int i;
  
  data->simulationInfo.analyticJacobians[index].sizeCols = 1;
  data->simulationInfo.analyticJacobians[index].sizeRows = 1;
  data->simulationInfo.analyticJacobians[index].seedVars = (modelica_real*) calloc(1,sizeof(modelica_real));
  data->simulationInfo.analyticJacobians[index].resultVars = (modelica_real*) calloc(1,sizeof(modelica_real));
  data->simulationInfo.analyticJacobians[index].tmpVars = (modelica_real*) calloc(0,sizeof(modelica_real));
  data->simulationInfo.analyticJacobians[index].sparsePattern.leadindex = (unsigned int*) malloc(1*sizeof(int));
  data->simulationInfo.analyticJacobians[index].sparsePattern.index = (unsigned int*) malloc(1*sizeof(int));
  data->simulationInfo.analyticJacobians[index].sparsePattern.colorCols = (unsigned int*) malloc(1*sizeof(int));
  data->simulationInfo.analyticJacobians[index].sparsePattern.maxColors = 1;
  data->simulationInfo.analyticJacobians[index].jacobian = NULL;
  
  /* write column ptr of compressed sparse column*/
  data->simulationInfo.analyticJacobians[index].sparsePattern.leadindex[$Px$pDERA$indexdiff] = 1;
  for(i=1;i<1;++i)
      data->simulationInfo.analyticJacobians[index].sparsePattern.leadindex[i] += data->simulationInfo.analyticJacobians[index].sparsePattern.leadindex[i-1];
  
  
  /* call functions to write index for each cref */
  HelloWorld_Hello_initialAnalyticJacobianA_0(data, index);
  
  /* write color array */
  data->simulationInfo.analyticJacobians[index].sparsePattern.colorCols[$Px$pDERA$indexdiff] = 1;
  
  return 0;
}
int HelloWorld_Hello_initialAnalyticJacobianB(void* inData)
{
  return 1;
}
int HelloWorld_Hello_initialAnalyticJacobianC(void* inData)
{
  return 1;
}
int HelloWorld_Hello_initialAnalyticJacobianD(void* inData)
{
  return 1;
}

int HelloWorld_Hello_functionJacG_column(void* data)
{
  return 0;
}
int HelloWorld_Hello_functionJacA_column(void* inData)
{
  DATA* data = ((DATA*)inData);
  int index = HelloWorld_Hello_INDEX_JAC_A;
  return 0;
}
int HelloWorld_Hello_functionJacB_column(void* data)
{
  return 0;
}
int HelloWorld_Hello_functionJacC_column(void* data)
{
  return 0;
}
int HelloWorld_Hello_functionJacD_column(void* data)
{
  return 0;
}


