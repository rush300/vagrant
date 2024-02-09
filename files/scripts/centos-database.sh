#!/bin/bash
# MySQL

yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysql start

mysql -u root -e "SHOW DATABASES";
