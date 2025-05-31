#
# ~/.bash_profile
#

# Start Hyprland with Universal Wayland Session Manager
if uwsm check may-start; then
	exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
fi

# Include .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
