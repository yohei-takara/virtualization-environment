#!/bin/bash
set -Ceu

USER="ocome"
# password "vagrant" を SHA-512 でハッシュ化
PASSWORD=$(perl -e 'print crypt("ocome", "\$6\$");')

create_user(){

  echo "${USER} is created."
  # Create User
  sudo useradd -p ${PASSWORD} -m ${USER}
  # grant authrity
  sudo usermod -G sudo ${USER}
  exit 0
}

trap "create_user" ERR
# check exist user
getent passwd ${USER}

echo "${USER} is already created."
