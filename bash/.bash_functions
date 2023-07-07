# You may want to put all your additions into a separate file like this,
# instead of adding them directly into ~/.bashrc.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# fetch git branch
function _parse_git_branch () {
    function _parse_git_dirty () {
        [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
    }
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(_parse_git_dirty))/"
}


# detach process
function _xshow () {
    nohup sh -c "$*" &>/tmp/xshow.out & disown
}


# fjump cd on exit
function _fjump () {
    [[ -f "$HOME/bin/ffinders/fjump" ]] || return 1
    PROMPT=${PS1@P}
    $HOME/bin/ffinders/fjump $$
    cd "$(cat /tmp/fjump$$)"
    if [[ -n "$TMUX" ]]; then
        NEWPROMPT=${PS1@P}
        [[ $NEWPROMPT == $PROMPT ]] || echo ${NEWPROMPT@P}
    fi
    rm -f /tmp/fjump$$
}
