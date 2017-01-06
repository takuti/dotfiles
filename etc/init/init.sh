#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  PLATFORM='mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  PLATFORM='linux'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

sudo -v

mkdir "$DOTPATH"/tmp

for i in "$DOTPATH"/etc/init/"$PLATFORM"/*.sh
do
    if [ -f "$i" ]; then
        log_info "$(e_arrow "$(basename "$i")")"
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done

for i in "$DOTPATH"/etc/init/common/*.sh
do
    if [ -f "$i" ]; then
        log_info "$(e_arrow "$(basename "$i")")"
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done

rm -rf "$DOTPATH"/tmp
