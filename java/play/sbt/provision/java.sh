#!/bin/bash
set -Ceu

USER="vagrant"
USER_HOME="/home/${USER}/"

su -l ${USER} -c "sdk install java"
