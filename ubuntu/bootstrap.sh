#!/usr/bin/env bash
#
# Set up ubuntu

set -e

gnomeVersion="$(cat /usr/share/gnome/gnome-version.xml | egrep "(platform|minor|micro)" | egrep -o "[0-9]+" | paste -sd "." -)"

user "A gnome plugin needs to be downloaded.  Please select the version for Gnome Version ${gnomeVersion}"
while ! prompt "Are you ready to open the browser?"; do
	echo "Well GET ready"
done

# TODO: automate this with bernaerts.dyndns.org/linux/76-gnome/283-gnome-shell-install-extension-command-line-script
xdg-open "https://extensions.gnome.org/extension/19/user-themes/"
while ! prompt "Have you installed the plugin yet?"; do
	echo "Why are you talking to me?? Get busy!!"
done

gsettings set org.gnome.desktop.background picture-uri file://${HOME}/.dotfiles/pics/Background.jpg
[[ ! -e /usr/share/glib-2.0/schemas/org.gnome.shell.extensions.user-theme.gschema.xml ]] && sudo ln -s ${HOME}/.dotfiles/ubuntu/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
dconf load /org/gnome/shell/extensions/ < ${HOME}/.dotfiles/ubuntu/theme_dconf.txt

gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Arc-Dark"

dconf load /org/gnome/terminal/ < ${HOME}/.dotfiles/ubuntu/terminal_config.dconf
dconf load / < ${HOME}/.dotfiles/ubuntu/favourites.dconf

