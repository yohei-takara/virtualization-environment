#!/bin/bash
set -Ceu

USER="vagrant"
# password "vagrant" を SHA-512 でハッシュ化
PASSWORD=$(perl -e 'print crypt("vagrant", "\$6\$");')

sudo useradd -p ${PASSWORD} -m ${USER}
