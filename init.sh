#!/bin/sh

# zsh
if [ ! -e ~/.zshrc ]; then
    ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
fi
if [ ! -e ~/.zsh ]; then
    ln -s ~/dotfiles/zsh/zsh ~/.zsh
fi

# mlterm
if [ ! -e ~/.mlterm ]; then
    ln -s ~/dotfiles/mlterm ~/.mlterm
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
    ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
fi
if [ ! -e ~/.tmux ]; then
    ln -s ~/dotfiles/tmux/tmux ~/.tmux
fi

# vim
if [ ! -e ~/.vimrc ]; then
    ln -s ~/dotfiles/vim/vimrc ~/.vimrc
fi
if [ ! -e ~/.vim ]; then
    ln -s ~/dotfiles/vim/vim ~/.vim
fi

# vimperator
if [ ! -e ~/.vimperatorrc ]; then
    ln -s ~/dotfiles/vimperator/vimperatorrc ~/.vimperatorrc
fi
if [ ! -e ~/.vimperator ]; then
    ln -s ~/dotfiles/vimperator/vimperator ~/.vimperator
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
