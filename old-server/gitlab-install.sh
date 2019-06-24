#!/bin/bash
#
# Instala GitLab Community Edition
#

# instala dependencias
sudo yum install curl policycoreutils openssh-server openssh-clients postfix
sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl enable postfix
sudo systemctl start postfix

# baixa rpm
cd ~/Downloads
wget -O gitlab-ce-8.12.7-ce.0.el7.x86_64.rpm https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-8.12.7-ce.0.el7.x86_64.rpm/download

rpm -i gitlab-ce-8.12.7-ce.0.el7.x86_64.rpm 
