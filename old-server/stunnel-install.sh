#!/bin/bash
#
# Instala stunnel para acesso a internet
#

yum install -y stunnel wget

#download
cd ~/Downloads
wget http://softwarelivre.bb.com.br/downloads/stunnel_linux.zip

unzip stunnel_linux 
cd stunnel-linux
tar -zxvf stunnel-linux.tgz -C /

sed -i 's/ExecStart=\/usr\/bin\/stunnel4/ExecStart=\/usr\/bin\/stunnel/' /etc/systemd/system/bbstunnel.service

systemctl enable bbstunnel.service
systemctl daemon-reload
systemctl start bbstunnel.service
