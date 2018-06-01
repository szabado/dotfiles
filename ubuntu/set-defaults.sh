#!/usr/bin/env bash

set -xe
sudo ln -s ${HOME}/.dotfiles/ubuntu/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
dconf load /org/gnome/shell/extensions/ < ${HOME}/.dotfiles/ubuntu/theme_dconf.txt
sudo shutdown -r 0
