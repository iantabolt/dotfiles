#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install fzf
yes | /usr/local/opt/fzf/install
brew update
brew install tree
brew install emacs
brew install fish

brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install rectangle

curl -L https://get.oh-my.fish | fish
omf install https://github.com/iantabolt/theme-bobthefish
