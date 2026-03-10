#!/bin/bash  

#shebang

component=$1
environment=$2
sudo dnf install ansible -y

cd /home/ec2-user

git clone https://github.com/sammusku/ansible-roboshop-roles-tf.git

cd ansible-roboshop-roles-tf
git pull

ansible-playbook -e component=$component -e env=$environment roboshop.yaml