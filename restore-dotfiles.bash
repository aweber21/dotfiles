#!/bin/bash
# This script automatically restores dotfiles

# Handle Arguments
# Help
if [[ "$#" -eq 1 ]] && [[ "$1" = "-h" ]]; then
	echo "0 Arguments - source: script location, destination: ~"
	echo "1 Argument  - source: argument, destination: ~"
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
# 0 Arguments - defaults to ~
# 1 Argument  - defaults to ~
# 2 Arguments - sets to value of second argument
# Otherwise   - exit
if [[ "$#" -eq 0 ]]; then
	RESTORE_DESTINATION=~
elif [[ "$#" -eq 1 ]]; then
	RESTORE_DESTINATION=~
elif [[ "$#" -eq 2 ]]; then
	RESTORE_DESTINATION="$2"
fi

# Make the destination directory if it doesn't exist
mkdir -p "$RESTORE_DESTINATION"

# Restore .bash* dotfiles
cp "$RESTORE_SOURCE"/.bash_profile "$RESTORE_DESTINATION"
cp "$RESTORE_SOURCE"/.bashrc "$RESTORE_DESTINATION"

# Restore .config dotfiles
# Source
CONFIG_SOURCE="$RESTORE_SOURCE"/.config

# Destination
mkdir -p "$RESTORE_DESTINATION"/.config
CONFIG_DESTINATION="$RESTORE_DESTINATION"/.config

# Fastfetch
cp -r "$CONFIG_SOURCE"/fastfetch "$CONFIG_DESTINATION"

# Hypr Ecosystem
cp -r "$CONFIG_SOURCE"/hypr "$CONFIG_DESTINATION"

# Kitty
cp -r "$CONFIG_SOURCE"/kitty "$CONFIG_DESTINATION"

# Neovim
cp -r "$CONFIG_SOURCE"/nvim "$CONFIG_DESTINATION"

# Rofi-Wayland
cp -r "$CONFIG_SOURCE"/rofi "$CONFIG_DESTINATION"

# UWSM
cp -r "$CONFIG_SOURCE"/uwsm "$CONFIG_DESTINATION"

# Vim
mkdir -p "$CONFIG_DESTINATION"/vim
cp "$CONFIG_SOURCE"/vim/vimrc "$CONFIG_DESTINATION"/vim

# Waybar
cp -r "$CONFIG_SOURCE"/waybar "$CONFIG_DESTINATION"

# Restore .ssh dotfiles
# Source
SSH_SOURCE="$RESTORE_SOURCE"/.ssh

# Destination
mkdir -p "$RESTORE_DESTINATION"/.ssh
SSH_DESTINATION="$RESTORE_DESTINATION"/.ssh

# Config
cp "$SSH_SOURCE"/config "$SSH_DESTINATION"
