# You may want to put all your additions into a separate file like this,
# instead of adding them directly into ~/.bashrc.

# See /usr/share/doc/bash-doc/examples in the bash-doc package.




# COLORS
########

RED='\033[1;36m'
YLW='\033[1;35m'
NC='\033[0m'




# FUNCTIONS
###########

# no alias
function _ask () {
    while true; do
        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi
        read -p "$1 [$prompt] " REPLY
        [[ -z "$REPLY" ]] && REPLY=$default
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}


# no alias
function _xhide () {
    [[ -f "/bin/xdo" ]] || return 1
    id=$(xdo id); xdo hide
    sh -c "$*" >/dev/null 2>&1
    xdo show "$id"
}


# no alias
function _xshow () {
    nohup sh -c "$*" &>/tmp/xshow.out & disown
}


function _ffm () {
    [[ -f "$HOME/bin/ffinders/ffm" ]] || return 1
    $HOME/bin/ffinders/ffm "$@"
    cd "$(cat /tmp/ffm)"
    rm -f /tmp/ffm
}
