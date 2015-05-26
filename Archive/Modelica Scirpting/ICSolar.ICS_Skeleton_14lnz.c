/* Linearization */
/* Simulation code for ICSolar.ICS_Skeleton generated by the OpenModelica Compiler 1.9.1 Beta4 (r22666) (RML version). */

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

#include "ICSolar.ICS_Skeleton_functions.h"
#include "ICSolar.ICS_Skeleton_model.h"
#include "ICSolar.ICS_Skeleton_literals.h"




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

#if defined(__cplusplus)
extern "C" {
#endif

const char *ICSolar_ICS_Skeleton_linear_model_frame()
{
  return "model linear_ICSolar_ICS__Skeleton\n  parameter Integer n = 38; // states \n  parameter Integer k = 0; // top-level inputs \n  parameter Integer l = 0; // top-level outputs \n"
  "  parameter Real x0[38] = {%s};\n"
  "  parameter Real u0[0] = {%s};\n"
  "  parameter Real A[38,38] = [%s];\n"
  "  parameter Real B[38,0] = zeros(38,0);%s\n"
  "  parameter Real C[0,38] = zeros(0,38);%s\n"
  "  parameter Real D[0,0] = zeros(0,0);%s\n"
  "  Real x[38](start=x0);\n"
  "  input Real u[0];\n"
  "  output Real y[0];\n"
  "\n  Real x_PPumpPT = x[1];\n  Real x_Pics_envelopecassette1PTubingPT = x[2];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB1rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[3];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB2rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[4];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB3rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[5];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB4rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[6];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB5rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[7];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB6rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[8];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB1rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[9];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB2rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[10];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB3rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[11];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB4rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[12];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB5rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[13];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB6rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[14];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB1rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[15];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB2rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[16];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB3rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[17];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB4rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[18];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB5rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[19];\n  Real x_Pics_envelopecassette1Pics_stack1PICS_Module_Twelve_1lB6rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[20];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB1rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[21];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB2rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[22];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB3rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[23];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB4rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[24];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB5rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[25];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB6rBPmodulereceiver1PreceiverInternalEnergy1Pheatcapacitor1PT = x[26];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB1rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[27];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB2rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[28];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB3rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[29];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB4rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[30];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB5rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[31];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB6rBPmodulereceiver1Ptubing_Losses1PTubingPT = x[32];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB1rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[33];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB2rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[34];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB3rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[35];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB4rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[36];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB5rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[37];\n  Real x_Pics_envelopecassette1Pics_stack2PICS_Module_Twelve_1lB6rBPmodulereceiver1Pwater_Block_HX1Pheatedpipe1PT = x[38];\n      \n"
  "equation\n  der(x) = A * x + B * u;\n  y = C * x + D * u;\nend linear_ICSolar_ICS__Skeleton;\n";
}
#if defined(__cplusplus)
}
#endif

