#!/bin/sh

cd "$(dirname "$0")" || exit

# vimrc
ln -sf "$(pwd)"/vimrc ~/.vimrc

# neovim
#ln -sf "$(pwd)"/nvim ~/.config
mkdir -p ~/.config/nvim
ln -sf "$(pwd)"/vimrc ~/.config/nvim/init.vim
