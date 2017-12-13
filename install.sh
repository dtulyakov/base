#!//usr/bin/env sh

######## SET
FDATE=$(/bin/date '+%Y/%m/%d')
set -x
######## SCRIPTS
sudo apt update -qq
sudo apt install apt-transport-https ca-certificates curl software-properties-common -yqq \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
  && curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - \
  && curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  && sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" \
  && sudo apt update -qq \
  && sudo apt install -yqq \
     docker-ce \
     bridge-utils \
     zsh \
     nmon \
     htop \
     bmon \
     nload \
     vlan \
     jq \
     ccze \
     cowsay \
     rsync \
     git \
     tmux \
     linux-image-extra-$(uname -r) \
     linux-image-extra-virtual \
  && sudo usermod -aG docker $USER

sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
  && sudo chmod +x /usr/local/bin/docker-compose

#  && sudo apt-add-repository ppa:ansible/ansible -y
