#!/bin/bash

component=$1
env=$2

cd /home/ec2-user

git clone https://github.com/sammusku/ansible-roboshop-roles-tf.git

cd ansible-roboshop-roles-tf

dnf install ansible -y

git pull

ansible-playbook -e component=$component -e env=$environment roboshop.yaml



