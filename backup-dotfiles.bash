#!/bin/bash
# This script automatically backs up dotfiles

# Handle Arguments
# Help
if [[ "$#" -eq 1 ]] && [[ "$1" = "-h" ]]; then
	echo "0 Arguments - source: ~/.config, destination: script location"
	echo "1 Argument  - source: ~/.config, destination: argument"
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
# 0 Arguments - defaults to ~/.config
# 1 Argument  - defaults to ~/.config
# 2 Arguments - sets to value of first argument
# Otherwise   - exit
if [[ "$#" -eq 0 ]]; then
	BACKUP_SOURCE=~/.config
elif [[ "$#" -eq 1 ]]; then
	BACKUP_SOURCE=~/.config
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

# Backup dotfiles
# Backgrounds
cp -r "$BACKUP_SOURCE"/backgrounds "$BACKUP_DESTINATION"

# Fastfetch
cp -r "$BACKUP_SOURCE"/fastfetch "$BACKUP_DESTINATION"

# Hypr Ecosystem
cp -r "$BACKUP_SOURCE"/hypr "$BACKUP_DESTINATION"

# Kitty
cp -r "$BACKUP_SOURCE"/kitty "$BACKUP_DESTINATION"

# Waybar
cp -r "$BACKUP_SOURCE"/waybar "$BACKUP_DESTINATION"

# Wofi
cp -r "$BACKUP_SOURCE"/wofi "$BACKUP_DESTINATION"
