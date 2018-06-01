#!/usr/bin/env bash

ln -s ${HOME}/.dotfiles/ubuntu/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/
glib-compile-schemas /usr/share/glib-2.0/schemas
dconf load ${HOME}/.dotfiles/ubuntu/
dconf load /org/gnome/shell/extensions/ < ${HOME}/.dotfiles/ubuntu/theme_dconf.txt
sudo shutdown -r 0
