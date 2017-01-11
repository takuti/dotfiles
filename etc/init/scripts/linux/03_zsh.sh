#!/bin/bash

which apt-get > /dev/null

if [ "$?" -eq 0 ]; then
  sudo apt-get install zsh
fi
