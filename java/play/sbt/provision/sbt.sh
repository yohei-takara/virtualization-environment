#!/bin/bash

USER_NAME="ubuntu"

wget https://github.com/sbt/sbt/releases/download/v0.13.15/sbt-0.13.15.tgz
tar xzvf sbt-0.13.15.tgz
sudo rm -rf sbt-0.13.15.tgz
sudo mv sbt /opt/sbt
sudo ln -sf /opt/sbt/bin/sbt /usr/local/bin/sbt

sudo chown -R ${USER_NAME}:${USER_NAME} /opt/sbt/bin/sbt
sudo chown -R ${USER_NAME}:${USER_NAME} /usr/local/bin/sbt
