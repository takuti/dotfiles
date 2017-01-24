#!/bin/bash

## Create nvim directory
mkdir -p "$HOME"/.config/nvim/dein

## Install dein.vim
echo "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh)" | bash -s "$HOME"/.config/nvim/dein

ln -sfnv "$DOTPATH"/.vimrc $HOME/.config/nvim/init.vim
