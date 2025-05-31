#!/bin/bash
# This script automatically backs up dotfiles

# Handle Arguments
# Help
if [[ "$#" -eq 1 ]] && [[ "$1" = "-h" ]]; then
	echo "0 Arguments - source: ~, destination: script location"
	echo "1 Argument  - source: ~, destination: argument"
	echo "2 Arguments - source: first argument, destination: second argument"
	echo "Usage: bash $0 [source] [destination]"
	exit
fi
# Too Many Arguments
if [[ "$#" -gt 2 ]]; then
	echo "Usage: bash $0 [source] [destination]"
	exit
fi

# Backup Source
# 0 Arguments - defaults to ~
# 1 Argument  - defaults to ~
# 2 Arguments - sets to value of first argument
# Otherwise   - exit
if [[ "$#" -eq 0 ]]; then
	BACKUP_SOURCE=~
elif [[ "$#" -eq 1 ]]; then
	BACKUP_SOURCE=~
elif [[ "$#" -eq 2 ]]; then
	BACKUP_SOURCE="$1"
fi

# Backup Destination
# 0 Arguments - defaults to script location
# 1 Argument  - sets to value of argument
# 2 Arguments - sets to value of second argument
# Otherwise   - exit
if [[ "$#" -eq 0 ]]; then
	BACKUP_DESTINATION=$(dirname "$(readlink -f "$0")")
elif [[ "$#" -eq 1 ]]; then
	BACKUP_DESTINATION="$1"
elif [[ "$#" -eq 2 ]]; then
	BACKUP_DESTINATION="$2"
fi

# Make the destination directory if it doesn't exist
mkdir -p "$BACKUP_DESTINATION"

# Backup .bash* dotfiles
cp "$BACKUP_SOURCE"/.bash_profile "$BACKUP_DESTINATION"
cp "$BACKUP_SOURCE"/.bashrc "$BACKUP_DESTINATION"

# Backup .config dotfiles
# Source
CONFIG_SOURCE="$BACKUP_SOURCE"/.config

# Destination
mkdir -p "$BACKUP_DESTINATION"/.config
CONFIG_DESTINATION="$BACKUP_DESTINATION"/.config

# Backgrounds
cp -r "$CONFIG_SOURCE"/backgrounds "$CONFIG_DESTINATION"

# Fastfetch
cp -r "$CONFIG_SOURCE"/fastfetch "$CONFIG_DESTINATION"

# Hypr Ecosystem
cp -r "$CONFIG_SOURCE"/hypr "$CONFIG_DESTINATION"

# Kitty
cp -r "$CONFIG_SOURCE"/kitty "$CONFIG_DESTINATION"

# UWSM
cp -r "$CONFIG_SOURCE"/uwsm "$CONFIG_DESTINATION"

# Vim
mkdir -p "$CONFIG_DESTINATION"/vim
cp "$CONFIG_SOURCE"/vim/vimrc "$CONFIG_DESTINATION"/vim

# Waybar
cp -r "$CONFIG_SOURCE"/waybar "$CONFIG_DESTINATION"

# Wofi
cp -r "$CONFIG_SOURCE"/wofi "$CONFIG_DESTINATION"

# Backup .ssh dotfiles
# Source
SSH_SOURCE="$BACKUP_SOURCE"/.ssh

# Destination
mkdir -p "$BACKUP_DESTINATION"/.ssh
SSH_DESTINATION="$BACKUP_DESTINATION"/.ssh

# Config
cp "$SSH_SOURCE"/config "$SSH_DESTINATION"
