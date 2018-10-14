#!/bin/bash

# ZSH
# TODO: Test this
sudo apt-get install zsh
chsh $(whoami) --shell /bin/zsh

# Oh-My-ZSH!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Zeit Oh-My-ZSH theme
curl https://raw.githubusercontent.com/zeit/zeit.zsh-theme/master/zeit.zsh-theme -Lo ~/.oh-my-zsh/themes/zeit.zsh-theme

# Hub
which brew && brew install hub
# TODO: Windows, linux

# rbenv
which brew && brew install rbenv
# TODO: Linux, Windows install of rbenv

# Node
# TODO: Determine platform and run appropriate script
echo "Go install Node.js from their website, or via package managers: https://nodejs.org/en/download/package-manager/"


