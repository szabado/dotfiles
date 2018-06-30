#!/usr/bin/env bash
#
# Set up ubuntu

set -e
gsettings set org.gnome.desktop.background picture-uri file://${HOME}/.dotfiles/pics/Background.jpg

[[ ! -e /usr/share/glib-2.0/schemas/org.gnome.shell.extensions.user-theme.gschema.xml ]] && sudo ln -s ${HOME}/.dotfiles/ubuntu/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas

# Load the defaults
cat ./ubuntu/config.dconf | egrep -v "^\s*#.*$" | dconf load /

