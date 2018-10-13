#!/bin/bash

DOTFILES=`pwd`
echo "export DOTFILES=$DOTFILES" > ~/.dotfiles_config
files=($(find . -name '*.symlink' -print | sed s/\.\.//))

function link() {
  ln -sfn $DOTFILES/$1 ~/.$2
  echo "symlinked $1 to ~/.$2"
}

function parse-filename() {
  local file=$(basename $1)
  local file="${file#.}"
  local file="${file%.symlink}"
  echo $file
}

for i in "${files[@]}"
do
  :
  file=$(parse-filename $i)
  link $i $file
done

source ~/.zshrc

