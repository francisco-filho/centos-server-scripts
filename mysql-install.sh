#!/bin/bash

#
yum group install "Development Tools" -y
yum install libxml2-devel -y

# download
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.16-2.el7.x86_64.rpm-bundle.tar

# untar
tar xvf mysql-8*.rpm-bundle.tar

# instala bibliotecas, server e cliente do mysql
yum localinstall mysql-community-{server,client,common,libs,libs-compat}-8.0.16-2.el7.x86_64.rpm

#alter user 'matomo'@'localhost' identified with mysql_native_password by '1Matomo!';

# inicia servidor
systemctl start mysqld

# ver password
# grep 'temporary password' /var/log/mysqld.log
#mysql> alter user 'root'@'localhost' identified by 'AbcDef7!';


#create user 'matomo'@'127.0.0.1' identified by '1Matomo!';
#grant all privileges on matomo.* to 'matomo'@'127.0.0.1';

