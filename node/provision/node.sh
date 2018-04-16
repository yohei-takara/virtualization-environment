#!/bin/bash
set -Ceu

USER="vagrant"
USER_HOME="/home/${USER}"
NODEBREW_HOME="${USER_HOME}/.nodebrew"
NODE_PATH_COMMAND="echo 'export PATH=${USER_HOME}/.nodebrew/current/bin:$PATH' >> ${USER_HOME}/.bashrc"

if [ ! -e ${NODEBREW_HOME} ]; then
  su -l ${USER} -c "curl -L git.io/nodebrew | perl - setup"
  su -l ${USER} -c "${NODE_PATH_COMMAND}"
  su -l ${USER} -c "${USER_HOME}/.nodebrew/nodebrew version"
  su -l ${USER} -c "${USER_HOME}/.nodebrew/nodebrew install-binary v8.11.1"
  su -l ${USER} -c "${USER_HOME}/.nodebrew/nodebrew use v8.11.1"
fi