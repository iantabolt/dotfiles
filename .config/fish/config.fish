# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/ian.tabolt/.config/omf"

autojump

# export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"

set JAVA_HOME (/usr/libexec/java_home 1.8)

alias git-push-u='git push -u origin (git branch | awk \'/^\* / { print $2 }\')'
alias el='emacs -Q -nw'

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set FZF_DEFAULT_COMMAND 'rg --files'

set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

alias ec='emacsclient -nw'

set -g EDITOR ec

set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
