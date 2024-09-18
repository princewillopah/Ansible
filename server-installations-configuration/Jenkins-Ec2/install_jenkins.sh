#!/bin/bash
exec > >(tee -i /var/log/user-data.log)
exec 2>&1
sudo apt update -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt install git -y 
mkdir Ansible && cd Ansible  ## make this "Ansible" dirctory in the newly provisioned Jenkins Instance
pwd
git clone https://github.com/princewillopah/Ansible.git
cd Ansible/server-installations-configuration  # this is where DevSecOps.yml is located.
ansible-playbook -i localhost DevSecOps.yml