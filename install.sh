#!/bin/bash

dotfiles=('zshrc' 'gitconfig')

echo 'copying:'
for file in "${dotfiles[@]}"; do
  echo $file
  cp .$file ~
done
