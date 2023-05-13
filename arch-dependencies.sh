#!/bin/bash

#GIT SOURCE I FOLLOW: https://github.com/owl4ce/dotfiles

#X.Org server and {it's,core} utilities. This is essentials.
PACKAGE_XORG="xorg xorg-xinit xorg-server xorg-xrandr xorg-xrdb"

#The UI kits and functionality. This is required.
#URxvt is highly recommended terminal emulator by default. Picom is optional, but recommended.
PACKAGE_UI="psmisc dunst nitrogen openbox rofi tint2 picom perl-gtk3 "

#Audio-server and audio stuff.
PACKAGE_AUDIO="pulseaudio pulseaudio-alsa mpd mpc ncmpcpp"

#Extended utilities. Required, but just as necessary.
PACKAGE_UTILS="alsa-utils brightnessctl imagemagick scrot w3m wireless_tools xclip xsettingsd xss-lock lightdm lightdm-gtk-greeter wget unzip tar"

#Additionals for completion of desktop compositions.
PACKAGE_ADD="thunar thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler geany geany-plugins gimp gsimplecal inkscape mpv parcellite pavucontrol viewnior xfce4-power-manager"

sudo pacman -S $PACKAGE_XORG $PACKAGE_UI $PACKAGE_AUDIO $PACKAGE_UTILS $PACKAGE_ADD


#Additionally Z shell with oh-my-zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(command -v zsh)
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions


#torrent transmission : https://objects.githubusercontent.com/github-production-release-asset-2e65be/35129809/0e7bbf21-fe21-4905-b3e0-3af285632ff9?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230513%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230513T131922Z&X-Amz-Expires=300&X-Amz-Signature=009cf1212d80bdc925b0a1982432e3ff373e89d24600b256c6e22e49288e2d9e&X-Amz-SignedHeaders=host&actor_id=86413845&key_id=0&repo_id=35129809&response-content-disposition=attachment%3B%20filename%3Dtransmission-4.0.3.tar.xz&response-content-type=application%2Foctet-stream

#https://transmissionbt.com/download
