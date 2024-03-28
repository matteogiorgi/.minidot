# You may want to put all your additions into a separate file
# like this, instead of adding them directly into ~/.bashrc.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# notify
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" \
"$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# tools
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFtr'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias xcopy='xclip-copyfile'
alias xpasta='xclip-pastefile'
alias xcut='xclip-cutfile'
alias stow='stow -S'
alias restow='stow -R'
alias unstow='stow -D'

# functions
alias fjump='_fjump'
