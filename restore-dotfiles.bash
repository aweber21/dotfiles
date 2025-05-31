#!/bin/bash
# This script automatically restores dotfiles

# Handle Arguments
# Help
if [[ "$#" -eq 1 ]] && [[ "$1" = "-h" ]]; then
	echo "0 Arguments - source: script location, destination: ~/.config"
	echo "1 Argument  - source: argument, destination: ~/.config"
	echo "2 Arguments - source: first argument, destination: second argument"
	echo "Usage: bash $0 [source] [destination]"
	exit
fi
# Too Many Arguments
if [[ "$#" -gt 2 ]]; then
	echo "Usage: bash $0 [source] [destination]"
	exit
fi

# Restore Source
# 0 Arguments - defaults to script location
# 1 Argument  - sets to value of argument
# 2 Arguments - sets to value of first argument
# Otherwise   - exit
if [[ "$#" -eq 0 ]]; then
	RESTORE_SOURCE=$(dirname "$(readlink -f "$0")")
elif [[ "$#" -eq 1 ]]; then
	RESTORE_SOURCE="$1"
elif [[ "$#" -eq 2 ]]; then
	RESTORE_SOURCE="$1"
fi

# Restore Destination
# 0 Arguments - defaults to ~/.config
# 1 Argument  - defaults to ~/.config
# 2 Arguments - sets to value of second argument
# Otherwise   - exit
if [[ "$#" -eq 0 ]]; then
	RESTORE_DESTINATION=~/.config
elif [[ "$#" -eq 1 ]]; then
	RESTORE_DESTINATION=~/.config
elif [[ "$#" -eq 2 ]]; then
	RESTORE_DESTINATION="$2"
fi

# Make the destination directory if it doesn't exist
mkdir -p "$RESTORE_DESTINATION"

# Backup dotfiles
# Backgrounds
cp -r "$RESTORE_SOURCE"/backgrounds "$RESTORE_DESTINATION"

# Fastfetch
cp -r "$RESTORE_SOURCE"/fastfetch "$RESTORE_DESTINATION"

# Hypr Ecosystem
cp -r "$RESTORE_SOURCE"/hypr "$RESTORE_DESTINATION"

# Kitty
cp -r "$RESTORE_SOURCE"/kitty "$RESTORE_DESTINATION"

# UWSM
cp -r "$RESTORE_SOURCE"/uwsm "$RESTORE_DESTINATION"

# Vim
mkdir "$RESTORE_DESTINATION"/vim
cp -r "$RESTORE_SOURCE"/vim/vimrc "$RESTORE_DESTINATION"/vim

# Waybar
cp -r "$RESTORE_SOURCE"/waybar "$RESTORE_DESTINATION"

# Wofi
cp -r "$RESTORE_SOURCE"/wofi "$RESTORE_DESTINATION"
