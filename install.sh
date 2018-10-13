#!/bin/bash

# Generate dotfiles_config
DOTFILES=$(pwd)
echo "###############################################" > ~/.dotfiles_config
echo "# This file is generated by hawkins/dotfiles. #" >> ~/.dotfiles_config
echo "# Run dotfiles/install.sh to repair this.     #" >> ~/.dotfiles_config
echo "###############################################" >> ~/.dotfiles_config
echo "export DOTFILES=$DOTFILES" >> ~/.dotfiles_config

# List all files and folders to be symlinked
files=($(find . -name '*.symlink' -print | sed s/\.\.//))

# Link $1 to ~/.$2
# Notice this adds the "." prefix
function link() {
  ln -sfn $DOTFILES/$1 ~/.$2 && echo "Linked $1 to ~/.$2"
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

# Finally, prepare the shell with new dotfiles
source ~/.zshrc

