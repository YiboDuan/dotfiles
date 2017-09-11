#!/bin/bash

dotfiles=('zshrc' 'gitconfig')

echo 'adding symlink:'
for file in "${dotfiles[@]}"; do
  echo $file
  ln -sf ~/dotfiles/.$file ~/.$file
done
