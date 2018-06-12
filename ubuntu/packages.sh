#!/usr/bin/env bash
#
# The equivalent to the macos brewfile

source install/helpers

set -e

installx() {
	running "Installing ${*}"
	sudo apt-get --assume-yes install ${@} > /dev/null 2>&1; ok
}

#########################
# Add required ppa's
#########################
info "Adding package repositories"

# Google Chrome
if [[ -z "$(which google-chrome-stable)" ]]; then
	running "Adding google-chrome-stable repo"
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub 2>/dev/null | sudo apt-key add -  > /dev/null 2>&1
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' > /dev/null 2>&1
	ok
fi

# Sublime Text
if [[ -z "$(which subl)" ]]; then
	running "Adding sublime-text repo"
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg 2>/dev/null | sudo apt-key add -  > /dev/null 2>&1
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null 2>&1
	ok
fi

running "Updating package list"
sudo apt-get --assume-yes update > /dev/null 2>&1; ok
running "Upgrading packages"
sudo apt-get --assume-yes upgrade > /dev/null 2>&1; ok

installx apt-transport-https
installx arc-theme
installx colordiff
installx curl
installx dconf-tools
installx deluge
installx firefox
installx git-core
installx gnome-tweak-tool
installx google-chrome-stable
# Install a bunch of power management guff
# TODO: Configure them
installx lm-sensors powertop tlp tlp-rdw
installx ncdu
installx net-tools
installx nmap
installx screen
installx speedcrunch
installx sshfs
installx sublime-text
installx tmux
installx traceroute
installx tree
installx xclip
installx unrar
installx vim
installx virtualbox
installx vlc
installx zsh

info "Installing other packages"

# Install oh-my-zsh
# TODO: find a way to check if this is already installed
running "Installing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - 2>/dev/null | zsh > /dev/null 2>&1; ok

# Install zsh-autocorrections
running "Installing zsh-autosuggestions"
[[ ! -e ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null 2>&1; ok

# Install calibre
running "Installing calibre"
[[ -z "$(which calibre)" ]] && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh 2>/dev/null | sudo sh /dev/stdin > /dev/null 2>&1; ok

# install ripgrep
running "Installing ripgrep"
if [[ -z "$(which rg)" ]]; then
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
	sudo dpkg -i ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
	rm -f ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
fi
ok

info "Configuring packages"

# Link speedcrunch to keyboard calculator key
running "Linking speedcrunch to keyboard calculator key"
if [[ "$(readlink '/usr/bin/gnome-calculator')" != "/usr/bin/speedcrunch" ]]; then
	# todo: fix this so we don't uninstall gnome-calculator if this script is run again
	lnx "/usr/bin/speedcrunch" "/usr/bin/gnome-calculator"
fi
ok

