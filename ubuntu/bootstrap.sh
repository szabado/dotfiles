#!/usr/bin/env bash
#
# Set up ubuntu

set -e
gsettings set org.gnome.desktop.background picture-uri file://${HOME}/.dotfiles/pics/Background.jpg
sudo ln -s ${HOME}/.dotfiles/ubuntu/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
dconf load /org/gnome/shell/extensions/ < ${HOME}/.dotfiles/ubuntu/theme_dconf.txt

