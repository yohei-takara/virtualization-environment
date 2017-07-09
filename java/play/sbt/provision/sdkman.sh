#!/bin/bash
set -Ceu

USER="vagrant"
USER_HOME="/home/${USER}/"

su -l ${USER} -c "curl -s 'https://get.sdkman.io' | bash"
su -l ${USER} -c "source '/home/vagrant/.sdkman/bin/sdkman-init.sh'"
su -l ${USER} -c "sdk version"
