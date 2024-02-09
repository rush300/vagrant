#!/bin/bash

yum update -y --exclude=kernel

yum install -y nano git unzip screen

yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
#
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysql start

mysql -u root -e "SHOW DATABASES";

# Download starter content
cd /vagrant
sudo -u vagrant wget -q https://github.com/rush300/vagrant/tree/main/files/index.html
sudo -u vagrant wget -q https://github.com/rush300/vagrant/tree/main/files/info.php

service httpd restart
