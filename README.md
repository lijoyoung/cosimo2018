# How to run the playbook

## login
From the AWS Console get the public_ip_address of the Ansible Control Server  
SSH to the Ansible Control Server using the supplied key - cosimo2018.pem or cosimo2018.ppk  

## On the Ansible Control Server
cd /etc/ansible  
ansible-playbook play_install_website.yml  

Note: Please give another 10 mins even after the ansible shows as tasks completed.  

# Browse website
From the AWS Console get the public_ip_address of the new server created by Name: Web Server  
http://<public_ip_address>/install  

## Enter following details
Database Username = root  
Database Name = cosimo2018  
Database Username Password = 2/XzS6atdd=h  
Email = <your_email>  

## Finally hit 'Install Now'  



