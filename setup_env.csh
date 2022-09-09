#!/bin/csh -f

########  THIS LINE MUST BE THE FIRST COMMAND LINE AFTER THE SHEBANG  ########
set sourced=($_) 
if ("$sourced" == "") then
  echo "ERROR: $0 must be sourced, not run." >> /dev/stderr
  exit 1
endif

if ( ! (-f ${cwd}/.git || -f ${cwd}/setup_env.csh) ) then
  echo "ERROR: You must go to the root directory of your GIT project database"
  echo "       where the setup_env.csh file is located."
  exit 1
endif
##############################################################################

# Project directory environment
setenv PROJECT_DIR          ${cwd}
setenv PROJECT_BUILD_DIR    ${PROJECT_DIR}/build
setenv PROJECT_CONFIG_DIR   ${PROJECT_DIR}/config
setenv PROJECT_MODULES_DIR  ${PROJECT_DIR}/modules
setenv PROJECT_SCRIPTS_DIR  ${PROJECT_DIR}/scripts

setenv DISPLAY "lnissrv4.eng.utah.edu:1006"

# CAD tool directories
set cad_tools_commun = "/uusoc/facility/cad_tools"
set cad_tools_lnis   = "/research/ece/lnis/CAD_TOOLS"

# HSPICE (Synopsys)
setenv HSP_HOME "${cad_tools_commun}/Synopsys/hspice_Q-2020.03-2/hspice"
if ( `where hspice` == "" ) then
    setenv PATH "${HSP_HOME}/bin:$PATH"
endif

# Questasim (Mentor)
setenv QUESTA_HOME "${cad_tools_commun}/Mentor/modelsim2019.4/questasim"
setenv LM_LICENSE_FILE "${cad_tools_commun}/Mentor/common_license"
if ( `where vsim` == "" ) then
    setenv PATH "${QUESTA_HOME}/linux_x86_64:$PATH"
endif

# DesignCompiler (Synopsys)
setenv DC_HOME "${cad_tools_commun}/Synopsys/syn_P-2019.03-SP5"
if ( `where dc_shell` == "" ) then
    setenv PATH "${DC_HOME}/bin:$PATH"
endif

# Update the modelsim configuration environment
set ori_msim_ini = "${QUESTA_HOME}/modelsim.ini"
set new_msim_ini = "${PROJECT_CONFIG_DIR}/modelsim.ini"
if ( -f ${ori_msim_ini} && ! -f ${new_msim_ini} ) then
    cp ${ori_msim_ini} ${new_msim_ini}
    chmod 775 ${new_msim_ini}
endif
setenv MODELSIM "${new_msim_ini}"

# Technology library root directory
setenv TECH_LIBRARY_PATH "${cad_tools_lnis}/DKITS"

# Set the project specific environment variables
source ${PROJECT_DIR}/config/setup_env.design.csh

# clean intermediate variables
unset ori_msim_ini new_msim_ini cad_tools_commun cad_tools_lnis
