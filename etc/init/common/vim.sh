#!/bin/bash

## Create nvim directory
mkdir -p "$HOME"/.config/nvim/dein

## Install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > "$DOTPATH"/tmp/installer.sh
. "$DOTPATH"/tmp/installer.sh "$HOME"/.config/nvim/dein

ln -sfnv "$DOTPATH"/.vimrc $HOME/.config/nvim/init.vim
