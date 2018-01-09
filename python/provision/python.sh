#!/bin/bash
set -Ceu

# Python公式
# https://www.python.jp/install/ubuntu/index.html

sudo apt update

sudo apt install -y build-essential \
                        libncursesw5-dev \
                        libgdbm-dev \
                        libc6-dev \
                        zlib1g-dev \
                        libsqlite3-dev \
                        tk-dev \
                        libssl-dev \
                        openssl \
                        libbz2-dev \
                        libreadline-dev



USER="ubuntu"
HOME_DIRECTORY="/home/${USER}"
PYENV_HOME="/home/${USER}/.pyenv"
PYENV_SHELL_PATH=${HOME_DIRECTORY}"/.bash_profile"
PYENV_COMMAND="source "${PYENV_SHELL_PATH}

sudo chmod 0664 ${PYENV_SHELL_PATH}
sudo chown ubuntu:ubuntu ${PYENV_SHELL_PATH}

if [ ! -e ${PYENV_HOME} ]; then
  sudo su -l ${USER} -c "git clone https://github.com/pyenv/pyenv.git ${PYENV_HOME}"

  sudo su -l ${USER} -c "${PYENV_COMMAND}"
  sudo su -l ${USER} -c "pyenv install 3.6.0"
  sudo su -l ${USER} -c "pyenv global 3.6.0"

  sudo su -l ${USER} -c "pip install requests"
  sudo su -l ${USER} -c "pip install lxml"
  sudo su -l ${USER} -c "pip install cssselect"
fi



