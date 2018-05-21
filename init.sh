#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fzf
yes | /usr/local/opt/fzf/install
brew install tree
brew install emacs --with-cocoa
brew install fish

brew tap caskroom/fonts
brew cask install font-fira-code
