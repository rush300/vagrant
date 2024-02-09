#!/bin/bash
#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql


# Download starter content
cd /vagrant
sudo -u vagrant wget -q >https://github.com/rush300/vagrant/tree/main/files/index.html
sudo -u vagrant wget -q >https://github.com/rush300/vagrant/tree/main/files/info.php

service httpd restart
