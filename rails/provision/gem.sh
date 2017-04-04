#!/bin/bash

USER_NAME="ubuntu"

echo "${USER_NAME}" | su -l ${USER_NAME} -c "gem -v"
echo "${USER_NAME}" | su -l ${USER_NAME} -c "gem install bundler"
