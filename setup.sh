#!/bin/bash -xe

echo Installing nano, git
yum install nano git expect -y

echo installing php 7.3
amazon-linux-extras install -y php7.3
yum install php-bcmath php-mbstring php-xml php-gd php-gmp -y

echo Installing apache
yum install httpd -y
yum install mod_ssl -y
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

echo Running MySQL secure installtion
mysql_temp_pass=$(grep 'temporary password' /var/log/mysqld.log | sed -n -e 's/^.*root@localhost: //p')
chmod +x /tmp/cosimo2018/expect.exp
/tmp/cosimo2018/expect.exp $mysql_temp_pass > /tmp/cosimo2018/expectOutput.txt

echo importing database
# fix mysql-8 limitation
mysql --user=root --password=2/XzS6atdd=h -e "alter user 'root'@'localhost' identified with mysql_native_password by '2/XzS6atdd=h';"       
mysql --user=root --password=2/XzS6atdd=h -e "create database cosimo2018"
cd /tmp/cosimo2018/database
mysql --user=root --password=2/XzS6atdd=h cosimo2018 < dizzcox.sql          

systemctl enable httpd
systemctl start httpd

# echo cleaning up
# rm -rf /tmp/*

echo Installation complete