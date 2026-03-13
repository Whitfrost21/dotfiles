#!/bin/bash

echo "Installing packages..."
sudo pacman -S --needed hyprland waybar wezterm wofi swaync fastfetch cava wallust wlogout stow

echo "Stowing dotfiles..."
cd ~/dots
stow -v . --ignore='.env' --ignore='.github' --ignore='assets'

echo "Done!"
