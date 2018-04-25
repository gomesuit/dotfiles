#!/bin/sh

cd "$(dirname "$0")" || exit

# vimrc
ln -sf "$(pwd)"/vimrc ~/.vimrc

# tmux
ln -sf "$(pwd)"/tmux.conf ~/.tmux.conf

# gitconfig
ln -sf "$(pwd)"/gitconfig ~/.gitconfig
