#!/bin/bash

USER_NAME="vagrant"
USER_HOME="/home/${USER_NAME}"

RUBY_VERSION="2.3.1"

apt-get install -y autoconf \
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
    git clone https://github.com/sstephenson/rbenv.git ${USER_HOME}/.rbenv
    # sudo apt-get install -y rbenv ruby-build

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ${USER_HOME}/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ${USER_HOME}/.bash_profile
    echo 'source .bashrc' >> ${USER_HOME}/.bash_profile

    chmod -R 775 ${USER_HOME}/.bash_profile
    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.bash_profile

    # exec $SHELL -l
fi

if [ ! -e "${USER_HOME}/.rbenv/plugins" ]; then
    mkdir ${USER_HOME}/.rbenv/plugins
fi

git clone https://github.com/sstephenson/ruby-build.git ${USER_HOME}/.rbenv/plugins/ruby-build

chmod -R 775 ${USER_HOME}/.rbenv
chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}/.rbenv

echo "${USER_NAME}" | su -l ${USER_NAME} -c "rbenv install $RUBY_VERSION"
echo "${USER_NAME}" | su -l ${USER_NAME} -c "rbenv global $RUBY_VERSION"
