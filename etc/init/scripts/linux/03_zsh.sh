#!/bin/bash

which apt-get > /dev/null

if [ "$?" -ne 0 ]; then
  sudo apt-get install zsh
fi
