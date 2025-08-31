#
# ~/.bash_profile
#

# Check for SSH session before starting Hyprland
if [ -z "$SSH_CLIENT" ] || [ -z "$SSH_CONNECTION" ] || [ -z "$SSH_TTY" ]; then
    # Start Hyprland with Universal Wayland Session Manager
    if uwsm check may-start; then
            exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
    fi
fi

# Include .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
