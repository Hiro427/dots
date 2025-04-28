#!/usr/bin/env bash

ln -s ~/.dotfiles/rofi ~/.config/rofi
ln -s ~/.dotfiles/picom ~/.config/picom
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/dunst ~/.config/dunst
ln -s ~/.dotfiles/wezterm/starship.toml ~/.config/starship.toml 
ln -s ~/.dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua 


sh ~/.dotfiles/zshrc/install.sh 

ln -s ~/.dotfiles/zshrc/.zshrc ~/.zshrc
