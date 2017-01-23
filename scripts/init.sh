#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  PLATFORM='mac'; export PLATFORM
  brew install zsh
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  PLATFORM='linux'; export PLATFORM
  YUM_CMD=$(which yum)
  APT_GET_CMD=$(which apt-get)
  if [[ ! -z $YUM_CMD ]]; then
    sudo yum install zsh
  elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get zsh
  else
    echo "WARNING: zsh was not able to be installed."
  fi
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=~/dotfiles; export DOTPATH
fi

sudo -v

mkdir "$DOTPATH"/tmp

bash "$DOTPATH"/scripts/zsh.sh
bash "$DOTPATH"/scripts/vim.sh

rm -rf "$DOTPATH"/tmp
