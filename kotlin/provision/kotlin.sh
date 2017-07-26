#!/bin/bash
set -Ceu

USER="ocome"
SDKMAN_HOME="/home/${USER}/.sdkman"
SDKMAN_SHELL_PATH=${SDKMAN_HOME}"/bin/sdkman-init.sh"
SDKMN_COMMAND="source "${SDKMAN_SHELL_PATH}

if [ ! -e ${SDKMAN_HOME} ]; then
  su -l ${USER} -c "curl -s 'https://get.sdkman.io' | bash"
  su -l ${USER} -c "${SDKMN_COMMAND}"
  su -l ${USER} -c "sdk version"
  su -l ${USER} -c "sdk install java"
  su -l ${USER} -c "sdk install kotlin"
fi
