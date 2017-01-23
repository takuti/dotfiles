#!/bin/bash

git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME"/.oh-my-zsh
mkdir -p "$HOME"/.oh-my-zsh/custom/themes
ln -sfnv "$DOTPATH"/etc/init/assets/common/zsh/my_theme.zsh-theme "$HOME"/.oh-my-zsh/custom/themes/my_theme.zsh-theme

echo "/bin/zsh" | sudo tee -a /etc/shells
sudo chsh -s /bin/zsh
