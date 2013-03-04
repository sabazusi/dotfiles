#!/bin/bash
mkdir plugins
git clone git://github.com/Shougo/neobundle.vim.git plugins/neobundle.vim
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
