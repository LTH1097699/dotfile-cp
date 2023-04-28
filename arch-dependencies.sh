#!/bin/bash

#GIT SOURCE I FOLLOW: https://github.com/owl4ce/dotfiles

#X.Org server and {it's,core} utilities. This is essentials.
PACKAGE_X="xorg-server xorg-xrandr xorg-xrdb"

#The UI kits and functionality. This is required.
#URxvt is highly recommended terminal emulator by default. Picom is optional, but recommended.
PACKAGE_UI="psmisc dunst nitrogen openbox rofi tint2 picom perl-gtk3 "

#Audio-server and audio stuff.
PACKAGE_AUDIO="pulseaudio pulseaudio-alsa mpd mpc ncmpcpp"

#Extended utilities. Required, but just as necessary.
PACKAGE_UTILS="alsa-utils brightnessctl imagemagick scrot w3m wireless_tools xclip xsettingsd xss-lock"

#Additionals for completion of desktop compositions.
PACKAGE_ADD="thunar thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler geany geany-plugins gimp gsimplecal inkscape mpv parcellite pavucontrol viewnior xfce4-power-manager"

#AUR package
PACKAGE_AUR="rxvt-unicode-truecolor-wide-glyphs obmenu-generator "

sudo pacman -S $PACKAGE_X $PACKAGE_UI $PACKAGE_AUDIO $PACKAGE_UTILS $PACKAGE_ADD

#not run on sudo
#yay -S $PACKAGE_AUR

#Additionally Z shell with oh-my-zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(command -v zsh)
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
