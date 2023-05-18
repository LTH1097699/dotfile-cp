#!/bin/bash

[[ -d "$HOME/Documents" ]] && {
        mkdir -p $HOME/Documents;
    } || {
        cd $HOME/Documents;
}



git clone https://aur.archlinux.org/yay.git
makepkg -si

yay -S pamac-aur rxvt-unicode-truecolor-wide-glyphs obmenu-generator
