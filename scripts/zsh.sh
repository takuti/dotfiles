#!/bin/bash

if [ "$PLATFORM" == 'mac' ]; then
  brew install zsh
elif [ "$PLATFORM" == 'linux' ]; then
  if [ ! -z $(which yum) ]; then
    sudo yum install zsh
  elif [ ! -z $(which apt-get) ]; then
    sudo apt-get install zsh
  else
    echo "WARNING: zsh was not able to be installed."
  fi
fi

git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME"/.oh-my-zsh
mkdir -p "$HOME"/.oh-my-zsh/custom/themes
ln -sfnv "$DOTPATH"/assets/zsh/my_theme.zsh-theme "$HOME"/.oh-my-zsh/custom/themes/my_theme.zsh-theme

if ! grep -q /bin/zsh /etc/shells; then
  echo "/bin/zsh" | sudo tee -a /etc/shells
fi
sudo chsh -s /bin/zsh
source ~/.zshrc
