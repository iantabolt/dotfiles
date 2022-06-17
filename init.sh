#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
yes | /usr/local/opt/fzf/install
brew install --cask emacs-mac

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install https://github.com/iantabolt/theme-bobthefish
