#!/bin/bash

## Create nvim directory
mkdir -p "$HOME"/.config/nvim
mkdir -p "$HOME"/.cache/dein

## Install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh

ln -sfnv "$DOTPATH"/.vimrc "$HOME"/.config/nvim/init.vim
