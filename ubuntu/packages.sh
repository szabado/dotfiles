#!/usr/bin/env bash
#
# The equivalent to the macos brewfile

source install/helpers

set -e

installx() {
	sudo apt-get --assume-yes install ${@} > /dev/null 2>&1 && success "Installed ${*}"
}

sudo apt-get --assume-yes update > /dev/null 2>&1
sudo apt-get --assume-yes upgrade > /dev/null 2>&1

# install the *required* things first
installx git-core
installx vim
installx zsh
# Install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - 2>/dev/null | zsh > /dev/null 2>&1
success "Installed oh-my-zsh"

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
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null 2>&1
success "Installed zsh-autosuggestions"

# install google chrome
if [[ -z "$(which google-chrome-stable)" ]]; then
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub 2>/dev/null | sudo apt-key add -  > /dev/null 2>&1
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' > /dev/null 2>&1
	sudo apt-get update > /dev/null 2>&1
fi
installx google-chrome-stable

# install sublime text
if [[ -z "$(which subl)" ]]; then
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg 2>/dev/null | sudo apt-key add -  > /dev/null 2>&1
	installx apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null 2>&1
	sudo apt-get update > /dev/null 2>&1
fi
installx sublime-text

# install calibre
[[ -z "$(which calibre)" ]] && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh 2>/dev/null | sudo sh /dev/stdin > /dev/null 2>&1
success "Installed calibre"

# install ripgrep
if [[ -z "$(which ripgrep)" ]]; then
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
	sudo dpkg -i ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
	rm -f ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
fi
success "Installed ripgrep"

