#!/bin/bash

USER_NAME="vagrant"

sudo apt-get install -y unzip

wget http://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12-minimal.zip
unzip typesafe-activator-1.3.12-minimal.zip
sudo rm -rf typesafe-activator-1.3.12-minimal.zip
sudo mv activator-1.3.12-minimal /opt/activator
sudo ln -sf /opt/activator/bin/activator /usr/local/bin/activator

sudo chown -R ${USER_NAME}:${USER_NAME} /opt/activator/bin/activator
sudo chown -R ${USER_NAME}:${USER_NAME} /usr/local/bin/activator
