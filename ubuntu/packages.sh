#!/usr/bin/env bash
#
# The equivalent to the macos brewfile

source install/helpers

set -e

installx() {
	sudo apt-get --assume-yes install ${@} > /dev/null && success "Installed ${*}"
}

sudo apt-get --assume-yes update > /dev/null
sudo apt-get --assume-yes upgrade > /dev/null

# install the *required* things first
installx git-core
installx vim
installx zsh
# Install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh > /dev/null && success "Installed oh-my-zsh"

installx arc-theme
installx colordiff
installx curl
installx dconf-tools
installx deluge
installx firefox
installx lm-sensors powertop tlp tlp-rdw
installx screen
installx sshfs
installx tmux
installx tree
installx xclip
installx vlc

# install google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' > /dev/null
sudo apt-get update > /dev/null
installx google-chrome-stable

# install sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - 
installx apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
installx sublime-text
success "Installed sublime text"

# install calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin > /dev/null && success "Installed calibre"

# install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb > /dev/null
sudo dpkg -i ripgrep_0.8.1_amd64.deb > /dev/null
success "Installed ripgrep"

