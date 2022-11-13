#!/bin/sh

# tmux
if [ ! -e ~/.tmux.conf ]; then
    ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
fi
if [ ! -e ~/.tmux ]; then
    ln -s ~/dotfiles/tmux/tmux ~/.tmux
fi

# vim
if [ ! -e ~/.vim ]; then
    ln -s ~/dotfiles/vim/vim ~/.vim
fi

# coc.vim
if [ ! -e ~/.vim/coc-settings.json ]; then
    ln -s ~/dotfiles/vim/coc-settings.json ~/.vim/
fi

# gcli
if [ ! -e ~/.gcli ]; then
    ln -s ~/dotfiles/gcli ~/.gcli
fi

# rubygems
if [ ! -e ~/.gemrc ]; then
    ln -s ~/dotfiles/gem/gemrc ~/.gemrc
fi

# awesome
if [ `uname -s` = 'Linux' ]; then
    if [ ! -e ~/.config ]; then
        mkdir ~/.config
    fi
    if [ ! -e ~/.config/awesome ]; then
        ln -s ~/dotfiles/awesome ~/.config/awesome
    fi
fi

# フォント設定(IPAモナーフォント前提)
if [ `uname -s` = 'Linux' ]; then
    if [ ! -e ~/.config ]; then
        mkdir ~/.config
    fi
    if [ ! -e ~/.config/fontconfig ]; then
        ln -s ~/dotfiles/fontconfig ~/.config/fontconfig
    fi
fi
