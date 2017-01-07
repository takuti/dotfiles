#!/bin/bash

if [ "$PLATFORM" == 'mac' ]; then
  brew install zsh
elif [ "$PLATFORM" == 'linux' ]; then
  sudo apt-get install zsh
else
  exit 1
fi

git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME"/.oh-my-zsh
mkdir -p "$HOME"/.oh-my-zsh/custom/themes
ln -sfnv "$DOTPATH"/etc/zsh/my_theme.zsh-theme "$HOME"/.oh-my-zsh/custom/themes/my_theme.zsh-theme

echo "/bin/zsh" | sudo tee -a /etc/shells
sudo chsh -s /bin/zsh
