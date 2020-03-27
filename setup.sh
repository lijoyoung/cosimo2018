#!/bin/bash -xe

echo Installing nano, git
yum install nano git -y

echo installing php 7.3
amazon-linux-extras install -y php7.3
yum install php-bcmath php-mbstring php-xml php-gd php-gmp -y

echo Installing apache
yum install httpd -y
touch /var/www/html/phpinfo.php
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

echo installing MySQL community edition
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
yum install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld

echo setting up website files
cd /tmp
git clone https://github.com/lijoyoung/cosimo2018.git
cd cosimo2018
unzip website.zip
cd installable_file
unzip dizzcox-v2.0.zip -d /var/www/html
yum install mod_ssl -y

systemctl enable httpd
systemctl start httpd

# echo cleaning up
# rm -rf /tmp/*

echo Installation complete