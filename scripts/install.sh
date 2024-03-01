#!/bin/bash

source global_fn.sh

clear

if [ $? -ne 0 ]; then
	echo "Error: running the script from the wrong directory."
	exit 1
fi

# Check for grub -> configure it


# Check for git -> install it if needed

if ! pkg_installed git 
then
	echo "installing git."
	sudo pacman -S git
else
	echo "git is already installed"
fi

# install yay

if ! pkg_installed yay 
then
	if [ -d ~/.clone ] 
	then
		rm -rf ~/.clone/yay
	else
		mkdir ~/.clone
	fi

	if pkg_installed git 
	then
		git clone https://aur.archlinux.org/yay-bin.git ~/.clone/yay
	else
		echo "git not installed"
		exit 1
	fi

	cd ~/.clone/yay
	makepkg -si --noconfirm

	if [ $? -eq 0 ] 
	then
		echo "finished installing yay"
	else
		echo "failed installing yay"
		exit 1
	fi
else
	echo "yay is already installed"
fi

# install hyprland

pkg_install hyprland		# WindowManager
pkg_install hyprlock		# LockScreen
pkg_install hypridle		# IdleDeamon
pkg_install waybar		# StatusBar
pkg_install ttf-font-awesome    # SpecialIconFont
pkg_install thunar		# FileExplorer
pkg_install rofi		# ApplicationLauncher
pkg_install dunst		# NotificationManager
# pkg_install kitty		# Terminal Emulator
pkg_install alacritty		# Terminal Emulator
pkg_install python-pywal	# ThemeGenerator
pkg_install swww		# WallpaperManager

# install other tools I use

pkg_install mercury-browser	# Browser
pkg_install pfetch		# minimalFetch
pkg_install neofetch		# fancyFetch
pkg_install sublime-text	# Editor

# symlink the relevant configs

rm -rf ~/.config/hypr
ln -s ~/hyprender/config/hypr ~/.config/
