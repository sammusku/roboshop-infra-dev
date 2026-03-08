#!/bin/bash  

#shebang

component=$1
sudo dnf install ansible -y

cd /home/ec2-user

git clone https://github.com/sammusku/ansible-roboshop-roles-tf.git

cd ansible-roboshop-roles-tf
git pull

ansible-playbook -e component=$component roboshop.yaml