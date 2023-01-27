#!/bin/bash 
 setenforce 0 
 
yum install httpd -y  
yum install epel-release yum-utils -y 
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y 
yum-config-manager --enable remi-php73 
yum install php php-mysql -y  
systemctl start httpd 
systemctl enable httpd 
 
yum install unzip wget -y 
rm -rf /var/www/html/* 
wget https://wordpress.org/latest.zip 
unzip latest.zip 
mv wordpress/* /var/www/html/ 
chown -R apache:apache /var/www/html