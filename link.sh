#!/bin/sh

cd "$(dirname "$0")" || exit

ln -sf "$(pwd)"/vimrc ~/.vimrc

