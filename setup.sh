#!/bin/bash

##  Configure OS ##############################################################
echo
echo "Disabling swap..."
sudo swapoff -a
echo
echo "Increasing vm.max_map_count..."
sudo sysctl -w vm.max_map_count=262144

## Remove legacy nodejs #######################################################
# sudo apt-get purge --auto-remove nodejs

## Install Pre-Requisites #####################################################
# Update Packages
sudo apt-get update -y -q
# Install Java
sudo apt-get install default-jdk -y -q
# Install Python
sudo apt install -y make python build-essential
sudo apt install python3-pip -y -q
pip3 install --upgrade pip
pip3 install elasticsearch
# Set 3.5 as default
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
# Install Docker
sudo apt-get install docker.io -y -q
# Install NPM
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install nodejs -y -q
sudo apt-get install npm -y -q


# Clone spring petclinic
## git data 
echo
echo "Download data ..."
cd /home/ubuntu
git clone https://github.com/EvelienSchellekens/spring-petclinic.git

# Make files writeable
chmod 777 /home/ubuntu/spring-petclinic/bin/setAPMenv.sh

# Add variables to profile
echo 'source /home/ubuntu/spring-petclinic/bin/setAPMenv.sh' >> ~/.bashrc 

# Pull online IDE
sudo docker pull elswork/theia:1.0.1