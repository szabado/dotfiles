#!/usr/bin/env bash
#
# The equivalent to the macos brewfile

sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade

# install the *required* things first
sudo apt-get --assume-yes install git-core
sudo apt-get --assume-yes install vim
sudo apt-get --assume-yes install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

sudo apt-get --assume-yes install arc-theme
sudo apt-get --assume-yes install colordiff
sudo apt-get --assume-yes install dconf-tools
sudo apt-get --assume-yes install deluge
sudo apt-get --assume-yes install firefox
sudo apt-get --assume-yes install google-chrome-stable libappindicator1 
sudo apt-get --assume-yes install lm-sensors powertop tlp tlp-rdw 
sudo apt-get --assume-yes install screen
sudo apt-get --assume-yes install sshfs
sudo apt-get --assume-yes install tree
sudo apt-get --assume-yes install xclip
sudo apt-get --assume-yes install vlc

# install sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get --assume-yes install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install sublime-text

# install calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
