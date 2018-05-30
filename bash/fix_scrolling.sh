#!/usr/bin/env bash

# On Ubuntu 17.10, after closing the lid and resuming, two finger scrolling would no longer work.
# Fix from: https://askubuntu.com/questions/528293/is-there-a-way-to-restart-the-touchpad-driver

fix_scrolling() {
	sudo modprobe -r psmouse
	sudo modprobe psmouse
	echo "Two finger scrolling should now be fixed!"
}

