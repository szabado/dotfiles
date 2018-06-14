#!/usr/bin/env bash

# To allow for a simple font bootstrapping script
ln -s ~/Library/Fonts ~/.fonts

# Commented out because I'm not *sure* this works, but it **should**  set the bacground image properly
# sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '${HOME}/.dotfiles/pics/Background.jpg'";
# killall Dock;
