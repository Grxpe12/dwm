#!/bin/bash

# List of packages to be installed
packages="dunst firefox xfce4-power-manager lxqt-powermanagement alacritty vim xfce4-clipman-plugin blueman bluez bluez-utils pulseaudio-bluetooth"

# Prompting user for confirmation
read -p "Your files will be backed up in the /backup folder and your system upgraded to ensure database is up-to-date. Do you want to proceed? [Y/n]: " output

# Checking user input
if [ -z "$output" ] || [[ "$output" =~ ^[Yy]$ ]]; then
    # Creating backup directory
    mkdir -p "$HOME/backup"
    
    # Backing up files to be replaced
    rsync -a "$HOME/.config/" "$HOME/backup/.config_backup"
    cp -r "$HOME/.vimrc" "$HOME/backup/.vimrc_backup"
    cp -r "$HOME/.xinitrc" "$HOME/backup/.xinitrc_backup"
    cp -r "$HOME/.bashrc" "$HOME/backup/.bashrc_backup"
    
    # Updating and installing packages
    if sudo pacman -Syu --noconfirm $packages; then
        # Removing old configurations in .config/
        rm -rf "$HOME/.config/dunst" "$HOME/.config/alacritty" "$HOME/.vim"

        # Copying the configuration files
        cp -r .vimrc "$HOME/"
        cp -r .viminfo "$HOME/"
        cp -r .vim "$HOME/"
        cp -r .xinitrc "$HOME/"
        cp -r .bashrc "$HOME/"
        cp -r wallpapers "$HOME/"
        cp -r emoji_list "$HOME/"
        cp -r suckless "$HOME/"
        cp -r .config/dunst "$HOME/.config/"
        cp -r .config/alacritty "$HOME/.config/"
        
        # Reminder message
        echo 'Remember to execute "sudo make clean install" for all of your suckless utilities in the ~/suckless/ folder. You may then reboot your system for all changes to take place.'
    else
        echo "Package installation failed."
    fi
else
    echo "Installation canceled."
fi
