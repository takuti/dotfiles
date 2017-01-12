#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  PLATFORM='mac'; export PLATFORM
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  PLATFORM='linux'; export PLATFORM
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=~/dotfiles; export DOTPATH
fi

sudo -v

mkdir "$DOTPATH"/tmp

for i in "$DOTPATH"/etc/init/scripts/"$PLATFORM"/*.sh
do
    if [ -f "$i" ]; then
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done

for i in "$DOTPATH"/etc/init/scripts/common/*.sh
do
    if [ -f "$i" ]; then
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done

rm -rf "$DOTPATH"/tmp
