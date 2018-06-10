#!/usr/bin/env bash
#
# The equivalent to the macos brewfile

source install/helpers

set -e

installx() {
	sudo apt-get --assume-yes install ${@} > /dev/null 2>&1 && success "Installed ${*}"
}

#########################
# Add required ppa's
#########################
info "Adding package repositories"

# Google Chrome
if [[ -z "$(which google-chrome-stable)" ]]; then
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub 2>/dev/null | sudo apt-key add -  > /dev/null 2>&1
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' > /dev/null 2>&1
	success "Added google chrome"
fi

# Sublime Text
if [[ -z "$(which subl)" ]]; then
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg 2>/dev/null | sudo apt-key add -  > /dev/null 2>&1
	installx apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null 2>&1
	success "Added sublime text"
fi

info "Updating package list"
sudo apt-get --assume-yes update > /dev/null 2>&1
info "Upgrading packages"
sudo apt-get --assume-yes upgrade > /dev/null 2>&1

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
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - 2>/dev/null | zsh > /dev/null 2>&1
success "Installed oh-my-zsh"

# Install zsh-autocorrections
[[ ! -e ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null 2>&1
success "Installed zsh-autosuggestions"

# Install calibre
[[ -z "$(which calibre)" ]] && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh 2>/dev/null | sudo sh /dev/stdin > /dev/null 2>&1
success "Installed calibre"

# install ripgrep
if [[ -z "$(which rg)" ]]; then
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
	sudo dpkg -i ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
	rm -f ripgrep_0.8.1_amd64.deb > /dev/null 2>&1
fi
success "Installed ripgrep"

info "Configuring packages"

# Link speedcrunch to keyboard calculator key
if [[ "$(readlink '/usr/bin/gnome-calculator')" != "/usr/bin/speedcrunch" ]]; then
	if [[ ! -e "/usr/bin/gnome-calculator-original" ]]; then
		sudo mv /usr/bin/gnome-calculator /usr/bin/gnome-calculator-original
		sudo ln -s /usr/bin/speedcrunch /usr/bin/gnome-calculator
		success "Linked speedcrunch to keyboard calculator key"
	else
		warn "Cannot link speedcrunch to keyboard: /usr/bin/gnome-calculator-original already exists"
	fi
fi

