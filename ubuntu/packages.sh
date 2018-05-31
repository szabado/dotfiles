#!/usr/bin/env bash
#
# The equivalent to the macos brewfile

sudo apt-get update
sudo apt-get upgrade

# install the *required* things first
sudo apt-get install git-core
sudo apt-get install vim
sudo apt-get install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

sudo apt-get install arc-theme
sudo apt-get install colordiff
sudo apt-get install dconf-tools
sudo apt-get install deluge
sudo apt-get install firefox
sudo apt-get install google-chrome-stable libappindicator1 
sudo apt-get install lm-sensors powertop tlp tlp-rdw 
sudo apt-get install screen
sudo apt-get install sshfs
sudo apt-get install tree
sudo apt-get install xclip
sudo apt-get install vlc

# install sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# install calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
