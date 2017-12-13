#!//usr/bin/env sh

######## SET
FDATE=$(/bin/date '+%Y/%m/%d')
set -x
######## SCRIPTS
apt update -qq
apt install apt-transport-https ca-certificates curl software-properties-common -yqq \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
  && curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add - \
  && curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc | apt-key add - \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  && add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" \
  && apt update -qq \
  && apt install -yqq \
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
     vim \
     virtualbox-5.2 \
     linux-image-extra-$(uname -r) \
     linux-image-extra-virtual \
  && usermod -aG docker $USER

curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose
echo "\n\n\nUse for install dotfiles"
echo 'bash <(curl -Ss https://raw.githubusercontent.com/dtulyakov/dotfiles/master/install.sh)'

#  && apt-add-repository ppa:ansible/ansible -y
