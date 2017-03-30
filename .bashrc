source /usr/local/bin/finto-helpers.sh

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function _update_ps1() {
    PS1="$(~/Develop/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
