#!/bin/bash

USER_NAME="ubuntu"
USER_HOME="/home/${USER_NAME}"

RUBY_VERSION="2.4.0"

sudo apt-get install -y autoconf \
                        bison \
                        build-essential \
                        libssl-dev \
                        libyaml-dev \
                        libreadline6-dev \
                        zlib1g-dev \
                        libncurses5-dev \
                        libffi-dev \
                        libgdbm3 \
                        libgdbm-dev

if [ ! -e "${USER_HOME}/.rbenv" ]; then
    sudo git clone https://github.com/sstephenson/rbenv.git ${USER_HOME}/.rbenv
    # sudo apt-get install -y rbenv ruby-build

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ${USER_HOME}/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ${USER_HOME}/.bash_profile

    # exec $SHELL -l
fi

if [ ! -e "${USER_HOME}/.rbenv/plugins" ]; then
    sudo mkdir ${USER_HOME}/.rbenv/plugins
fi

sudo git clone https://github.com/sstephenson/ruby-build.git ${USER_HOME}/.rbenv/plugins/ruby-build

sudo chmod -R 775 ${USER_HOME}/.rbenv
sudo chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.rbenv

echo "${USER_NAME}" | su -l ${USER_NAME} -c "rbenv install $RUBY_VERSION"
echo "${USER_NAME}" | su -l ${USER_NAME} -c "rbenv global $RUBY_VERSION"
