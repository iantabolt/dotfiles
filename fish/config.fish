if status is-interactive
  [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

  set PATH ~/.emacs.d/bin $PATH
end

set NVM_DIR "$HOME/.nvm"
