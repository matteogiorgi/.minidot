#  ____            _
# | __ )  __ _ ___| |__
# |  _ \ / _` / __| '_ \
# | |_) | (_| \__ \ | | |
# |____/ \__,_|___/_| |_|
#
# Bourne again shell - https://www.gnu.org/software/bash/
# ---
# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files in the
# bash-doc package for examples.
# ---
# black  = 30    blue    = 34    reset      = 0
# red    = 31    magenta = 35    bold       = 1
# green  = 32    cyan    = 36    faint      = 2
# yellow = 33    white   = 37    underlined = 4




### Only interactive mode
#########################

case $- in
    *i*) ;;
      *) return;;
esac




### History
###########

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend




### Window size and pathname expansion
######################################

shopt -s checkwinsize
shopt -s globstar




### Friendly less and working chroot
####################################

[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
# ---
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi




### Functions and alias definition
##################################

[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases




### Fancy prompt
################

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac




### PS1 (with color support)
############################

if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;90m\]\t\[\033[00m\] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;94m\]\w\[\033[00m\]'
    [[ $(type -t __fetch_git_branch) == function ]] && PS1+='\[\033[01;33m\]$(__fetch_git_branch " (%s)")\[\033[00m\]'
    [[ -n "$TMUX" ]] && PS1+='\n ' || PS1+='\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\t \u@\h:\w'
    [[ $(type -t __fetch_git_branch) == function ]] && PS1+='$(__fetch_git_branch " (%s)")'
    [[ -n "$TMUX" ]] && PS1+='\n ' || PS1+='\$ '
fi




### XTerm title
###############

case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac




### Programmable completion features
####################################

if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        . /etc/bash_completion
    fi
fi




### Environment variables
#########################

export TERM="xterm-256color"
export SHELL="/bin/bash"
export PAGER="/bin/less -~"
export BAT_THEME="base16"




### Fzf variables
#################

export FZF_DEFAULT_OPTS='--color=16,bg+:0,fg+:regular:-1,hl+:regular:underline,gutter:-1,pointer:reverse,marker:reverse --pointer="  " --marker=" "'
export FZF_ALT_C_COMMAND='/bin/ls -ap . | grep -E "/$" | tr -d "/"'
export FZF_CTRL_T_COMMAND='rg --files --hidden -g "!.git" 2>/dev/null'




### Color support for less, gcc and ls
######################################

# less
export LESS_TERMCAP_mb=$'\e[01;31m'     # begin blinking
export LESS_TERMCAP_md=$'\e[01;31m'     # begin bold
export LESS_TERMCAP_me=$'\e[0m'         # end mode
export LESS_TERMCAP_so=$'\e[01;44;37m'  # begin standout-mode
export LESS_TERMCAP_se=$'\e[0m'         # end standout-mode
export LESS_TERMCAP_us=$'\e[01;33m'     # begin underline
export LESS_TERMCAP_ue=$'\e[0m'         # end underline

# gcc
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ls
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi




### Source stuff
################

# fzf config (to be added for extra features)
[[ -f $HOME/.fzf.bash ]] && source $HOME/.fzf.bash

# fzf completion and key bindings
[[ -f $HOME/.config/fzf/completion.bash ]] && source $HOME/.config/fzf/completion.bash
[[ -f $HOME/.config/fzf/key-bindings.bash ]] && source $HOME/.config/fzf/key-bindings.bash




## Completion and other settings
## (no ~/.inputrc for this part)
################################

bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'
# ---
bind 'set show-all-if-ambiguous on'            # completions listed immediately
bind 'set show-all-if-unmodified on'           # completions with no partial completion
bind 'set completion-ignore-case on'           # auto completion to ignore cases
bind 'set completion-prefix-display-length 3'  # 3 char as common prefix in completions
bind 'set mark-symlinked-directories on'       # symlink dir completion to have a slash
bind 'set visible-stats on'                    # completions appending characters indicating file type
bind 'set colored-stats on'                    # completions using different colors




### Extra configuration to be written inside .bash_extras
#########################################################

[[ -f $HOME/.bash_extras ]] && source $HOME/.bash_extras
