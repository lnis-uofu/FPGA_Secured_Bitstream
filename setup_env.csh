#!/bin/csh -f

######## THIS LINE MUST BE THE FIRST COMMAND LINE AFtER THE sHEBANG ###########
set sourced=($_)
if ("$sourced" == "") then 
    echo "ERROR: $0 must be sourced, not run." >> /dev/stderr
    exit 1
endif

if ( ! (-f ${cwd}/.git || -f ${cwd}/setup_env.csh) ) then
    echo "ERROR: You must go to the root directory of you GIT project database"
    echo "       where the setup_env.chs file is located."
    exit 1
endif



###############################################################################

# Project directory environment
setenv PROJECT_DIR          ${cwd}
setenv PROJECT_BUILD_DIR    ${PROJECT_DIR}/build
setenv PROJECT_CONFIG_DIR   ${PROJECT_DIR}/config
setenv PROJECT_MODULES_DIR  ${PROJECT_DIR}/modules
setenv PROJECT_SCRIPTS_DIR  ${PROJECT_DIR}/scripts

# display
#setenv DISPLAY :1002

# Modelsim

set ori_msim_ini = "${QUESTA_HOME}/modelsim.ini"
set new_msim_ini = "${PROJECT_CONFIG_DIR}/modelsim.ini"
if ( -f ${ori_msim_ini} && ! -f ${new_msim_ini} ) then
    cp ${ori_msim_ini} ${new_msim_ini}
    chmod 775 ${new_msim_ini}
endif

setenv MODELSIM "${new_msim_ini}"
unset ori_msim_ini   new_msim_ini

# Set the project specifi environment variables
source ${PROJECT_DIR}/config/setup_env.design.csh
