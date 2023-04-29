#!/bin/bash

git clone https://aur.archlinux.org/yay.git  $HOME/Documents
cd $HOME/Documents/yay
makepkg -si

yay -S pamac-aur rxvt-unicode-truecolor-wide-glyphs obmenu-generator
