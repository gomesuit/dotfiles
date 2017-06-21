#!/bin/sh

cd "$(dirname "$0")" || exit

# vimrc
ln -sf "$(pwd)"/vimrc ~/.vimrc

# neovim
ln -sf "$(pwd)"/nvim ~/.config
