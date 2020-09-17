[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set FZF_DEFAULT_COMMAND 'rg --files'

set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal

set EDITOR emacs

alias ec "emacsclient -t --alternate-editor=''"
alias ecw "open -a emacs"

function opsignin
  set account $argv[1]
  op signin --raw $account > ~/.op/session_$account
end

function op1
  set account $argv[1]
  # set -q OP_SESSION_$account || opsignin $argv[1]
  set age (math (date +%s) - (stat -t %s -f %m -- ~/.op/session_$account))
  # session expires after 30 minutes
  if [ $age -ge 1800 ]
    echo "Session expired."
    opsignin $account
  end
  touch ~/.op/session_$account # update timestamp
  op --account $account --session (cat ~/.op/session_$account) $argv[2..99]
end

function oplogin
  string split ',' (op1 $argv[1] get item $argv[2] --format csv --fields username,password) 
end

set PATH /Users/iantabolt/.gem/ruby/2.3.0/bin $PATH

function alertdone
  osascript -e 'tell app "Terminal" to display dialog "Done"'
end

function gch
  git checkout (git branch --all | fzf | tr -d '[:space:]')
end
