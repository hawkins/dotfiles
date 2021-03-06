#!/bin/zsh

# Generate dotfiles_config
DOTFILES=$(pwd)
echo "###############################################" > ~/.dotfiles_config
echo "# This file is generated by hawkins/dotfiles. #" >> ~/.dotfiles_config
echo "# Run dotfiles/install.sh to repair this.     #" >> ~/.dotfiles_config
echo "###############################################" >> ~/.dotfiles_config
echo "export DOTFILES=$DOTFILES" >> ~/.dotfiles_config

# Handle submodules before we do anything else
git submodule update --init --recursive

# Link $1 to ~/.$2
# Notice this adds the "." prefix
function link() {
  ln -sfn $DOTFILES/$1 ~/.$2 && echo "Linked $1 to ~/.$2"
}

# Reformat name from its friendly name
function strip() {
  local file=$(basename $1)
  local file="${file#.}"
  local file="${file%.symlink}"
  echo $file
}

# Symlink all files and folders whose name ends with `.symlink`
files=($(find . -name '*.symlink' -print | sed s/\.\.//))
for i in "${files[@]}"
do
  link $i $(strip $i)
done

# Link special purpose files
ln -fn $DOTFILES/zsh/zeit.zsh-theme ~/.oh-my-zsh/themes/zeit.zsh-theme && echo "Installed ZSH Theme: Zeit"

# Finally, prepare the shell with new dotfiles
source ~/.zshrc
