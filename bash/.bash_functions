# You may want to put all your additions into a separate file like this,
# instead of adding them directly into ~/.bashrc.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# fetch git branch
function __fetch_git_branch () {
    function __fetch_git_status () {
        [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
    }
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(__fetch_git_status))/"
}


# fjump cd on exit
function _fjump () {
    [[ -f "$HOME/bin/ffinders/fjump" ]] || return 1
    OWD=$PWD
    $HOME/bin/ffinders/fjump $$
    cd "$(cat /tmp/fjump$$)"
    [[ -n "$TMUX" && $PWD != $OWD ]] && echo ${PS1@P}
    rm -f /tmp/fjump$$
}


# detach process
function _xshow () {
    nohup sh -c "$*" &>/tmp/xshow.out & disown
}
