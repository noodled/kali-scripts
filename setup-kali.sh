#!/bin/bash

# Set up Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list 
apt update
apt install docker-ce -y

# Install node-js
apt install nodejs npm -y

# Install aquatone for bounty recon
gem install aquatone

# Set directory to store new stuff
mkdir /root/scripts

# Grab some good open source scripts, etc
cd /root/scripts
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/jhaddix/domain; mv ./domain ./enumall
git clone https://github.com/wireghoul/graudit.git

# Get ready to decompile flash stuff
cd /root/scripts
mkdir -p /root/scripts/flash-exploit/flare/ /root/scripts/flash-exploit/flasm
wget http://www.nowrap.de/download/flare06linux.tgz
tar -xzvf ./flare06linux.tgz --directory /root/scripts/flash-exploit/flare/; rm -f flare06linux.tgz
wget http://www.nowrap.de/download/flasm16linux.tgz
tar -xzvf ./flasm16linux.tgz --directory /root/scripts/flash-exploit/flasm/; rm -f ./flasm16linux.tgz
