[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set FZF_DEFAULT_COMMAND 'rg --files'

set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal

set EDITOR emacs

alias ec "emacsclient -t --alternate-editor=''"