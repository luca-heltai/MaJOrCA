#!/bin/bash

# Source variables, compilers, and modules:
################################################################################
source "./_export.cfg"

dim=2
# PDE (fluid-dynamics|turbulence)
PDE="fluid-dynamics"
prm=flow_past_a_cylinder_2D_00.prm
# viscosity:
nu=0.1
# number of refinemens:
ref=7
# stepper (euler|ida):
stepper=euler
# div-grad stabilization
div_grad=1.0

init_time=30
fin_time=0
time_step=1e-3
out_time=1e-1

NAME_JOB="_tmp_${prm}_nu=${nu}_ref=${ref}_stepper=${stepper}"
cp "_template.pbs" ${NAME_JOB}

${FIND_AND_REPLACE} "__PDE__" ${PDE} ${NAME_JOB}
${FIND_AND_REPLACE} "__DIM__" ${dim} ${NAME_JOB}
${FIND_AND_REPLACE} "__PRM__" ${prm} ${NAME_JOB}
${FIND_AND_REPLACE} "__NU__" ${nu} ${NAME_JOB}
${FIND_AND_REPLACE} "__REF__" ${ref} ${NAME_JOB}
${FIND_AND_REPLACE} "__STEPPER__" ${stepper} ${NAME_JOB}
${FIND_AND_REPLACE} "__DIV_GRAD__" ${div_grad} ${NAME_JOB}