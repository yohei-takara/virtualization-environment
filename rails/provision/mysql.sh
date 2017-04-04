#!/bin/bash


sudo apt-get install -y libmysqld-dev

export MYSQLPW="admin"
echo "mysql-server mysql-server/root_password password $MYSQLPW" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQLPW" | sudo debconf-set-selections
sudo apt-get -y install mysql-server

sudo cp /etc/mysql/my.cnf /etc/mysql/my.cnf.org
sudo sed -i "/\[mysqld\]/i default-character-set=utf8\n" /etc/mysql/my.cnf
sudo sed -i "/\[mysqldump\]/i character-set-server=utf8\n" /etc/mysql/my.cnf
sudo sed -i "/\[mysql\]/i default-character-set=utf8\n" /etc/mysql/my.cnf
# key_buffer を key_buffer_size に置換
sudo sed -i -e 's/key_buffer/key_buffer_size/g' /etc/mysql/my.cnf
# myisam-recover を myisam-recover-optionsに置換
sudo sed -i -e 's/myisam-recover/myisam-recover-options/g' /etc/mysql/my.cnf
