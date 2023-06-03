#!/bin/bash
yay_install()
{
    [[ ! -d $HOME/Documents ]] && {
            mkdir -p $HOME/Documents;
    } || {
            git clone https://aur.archlinux.org/yay.git $HOME/Documents;
            cd $HOME/Documents;
    }

    makepkg -si;
}

yay_install;
yay -S pamac-aur rxvt-unicode-truecolor-wide-glyphs obmenu-generator
