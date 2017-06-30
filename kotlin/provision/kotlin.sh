#!/bin/bash
set -Ceu

USER="ocome"

su -l ${USER} -c "curl -s 'https://get.sdkman.io' | bash"
su -l ${USER} -c "source '/home/ocome/.sdkman/bin/sdkman-init.sh'"
su -l ${USER} -c "sdk version"
su -l ${USER} -c "sdk install java"
su -l ${USER} -c "sdk install kotlin"
