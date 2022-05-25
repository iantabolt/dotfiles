#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install fzf
yes | /usr/local/opt/fzf/install
brew update
brew install tree
brew install emacs
brew install fish

brew tap homebrew/cask-fonts
brew install font-fira-code font-fira-code-nerd-font
brew install rectangle

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/iantabolt/theme-bobthefish
