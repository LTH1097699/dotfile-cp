#!/bin/bash

#FONTS
DIR_HOME=$(echo ~)
DIR_CURRENT=$(pwd)
echo $DIR_CURRENT

mkdir -pv $DIR_HOME/.fonts/{Cantarell,Comfortaa,IcoMoon-Custom,Nerd-Patched,Unifont}
wget --no-hsts -cNP ~/.fonts/Comfortaa/ "https://raw.githubusercontent.com/googlefonts/comfortaa/main/fonts/OTF/Comfortaa-{Bold,Regular}.otf"
wget --no-hsts -cNP ~/.fonts/IcoMoon-Custom/ "https://github.com/owl4ce/dotfiles/releases/download/ng/{Feather,Material}.ttf"
wget --no-hsts -cNP ~/.fonts/Nerd-Patched/ "https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.ttf"
wget --no-hsts -cNP ~/.fonts/Unifont/ ":https://unifoundry.com/pub/unifont/unifont-14.0.02/font-builds/unifont-14.0.02.ttf"
wget --no-hsts -cN "https://download-fallback.gnome.org/sources/cantarell-fonts/0.303/cantarell-fonts-0.303.1.tar.xz"
cd $DIR_HOME/Downloads/config
tar -xvf cantarell*.tar.xz --strip-components 2 --wildcards -C $DIR_HOME/.fonts/Cantarell/ \*/\*/Cantarell-VF.otf

#ICONS
mkdir -pv $DIR_HOME/.icons

wget --no-hsts -cN "https://github.com/owl4ce/dotfiles/releases/download/ng/{Gladient_JfD,Papirus{,-Dark}-Custom}.tar.xz"

tar -xf Gladient_JfD.tar.xz -C ~/.icons/
tar -xf Papirus-Custom.tar.xz -C ~/.icons/
tar -xf Papirus-Dark-Custom.tar.xz -C ~/.icons/
sudo ln -vs ~/.icons/Papirus-Custom /usr/share/icons/
sudo ln -vs ~/.icons/Papirus-Dark-Custom /usr/share/icons/

#Wallpapers
mkdir -pv ~/.wallpapers/{mechanical,eyecandy}
wget --no-hsts -cNP ~/.wallpapers/mechanical/ "https://github.com/owl4ce/dotfiles/releases/download/ng/{batik-1_4K,okita-souji_FHD}.jpg"
wget --no-hsts -cNP ~/.wallpapers/eyecandy/ "https://github.com/owl4ce/dotfiles/releases/download/ng/{cherry-blossoms,floral-artistic-2}_FHD.jpg"


#Extensions (URxvt)
mkdir -pv ~/.urxvt/ext
(cd ~/.urxvt/ext/; curl -LO "https://raw.githubusercontent.com/simmel/urxvt-resize-font/master/resize-font")
(cd ~/.urxvt/ext/; curl -LO "https://raw.githubusercontent.com/mina86/urxvt-tabbedex/master/tabbedex")
