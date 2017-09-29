#!/bin/bash

################ Set up some variables ################
HOSTNAME=workstation01
################  Done with variables  ################

# Change the password
passwd

# Change the hostname (kali looks suspicious on a network)
echo $HOSTNAME > /etc/hostname
hostname $HOSTNAME

# General updates
apt update; apt upgrade -y;

# Get Metasploit ready
systemctl enable postgresql; systemctl start postgresql
systemctl restart metasploit
msfdb init
echo exit | msfconsole                                                 # sets up the needed .msf4 folder
echo "spool /root/msf_console.log" > /root/.msf4/msfconsole.rc         # enables logging of all msf activity

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

# TOOL - HTTPScreenShot
apt install python-selenium -y
git clone https://github.com/breenmachine/httpscreenshot.git /root/scripts/httpscreenshot
cd /root/scripts/httpscreenshot
chmod 700 install-dependencies.sh && ./install-dependencies.sh

# TOOL - smbexec
git clone https://github.com/pentestgeek/smbexec.git /root/scripts/smbexec
cd /root/scripts/smbexec && ./install.sh                                     # Note: this is an interactive installer
./install.sh                                                                 # Need to run second time to compile binaries

# Get ready to decompile flash stuff
wget https://www.free-decompiler.com/flash/download/ffdec_10.0.0.deb
apt install ./ffdec_10.0.0.deb -y                                                       # for editing the swf packages
rm -f ./ffdec_10.0.0.deb
mkdir /root/scripts/flash-stuff; cd /root/scripts/flash-stuff
wget https://fpdownload.macromedia.com/get/flashplayer/updaters/27/playerglobal27_0.swc # required to edit scripts inline
