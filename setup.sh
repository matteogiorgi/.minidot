#!/usr/bin/env bash

# This '.minidot' setup script will install a minimal work environment complete
# with all the bells and whistles needed to start working properly.

# There are no worries of losing a potential old configuration: il will be
# stored in a separate folder in order to be restored on demand apon uninstall.




### This should retrieve current script path
############################################

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"




### Colors definition
#####################

RED='\033[1;36m'
YLW='\033[1;35m'
NC='\033[0m'




### Functions definition
########################

_banner () {
    printf "\n${YLW}%s${NC}"          "                 _       _     _       _   "
    printf "\n${YLW}%s ${RED}%s${NC}" "       _ __ ___ (_)_ __ (_) __| | ___ | |_ " "  Matteo Giorgi (Geoteo)"
    printf "\n${YLW}%s ${RED}%s${NC}" "      | '_ ' _ \| | '_ \| |/ _' |/ _ \| __|" "  https://www.geoteo.net"
    printf "\n${YLW}%s ${RED}%s${NC}" "     _| | | | | | | | | | | (_| | (_) | |_ " "  https://github.com/matteogiorgi/.minidot"
    printf "\n${YLW}%s${NC}\n\n"      "    (_)_| |_| |_|_|_| |_|_|\__,_|\___/ \__|"
}


_warning () {
    if [ "$(id -u)" = 0 ]; then
        printf "\n${RED}%s${NC}"     "    This script MUST NOT be run as root user since it makes changes"
        printf "\n${RED}%s${NC}"     "    to the \$HOME directory of the \$USER executing this script."
        printf "\n${RED}%s${NC}"     "    The \$HOME directory of the root user is, of course, '/root'."
        printf "\n${RED}%s${NC}"     "    We don't want to mess around in there. So run this script as a"
        printf "\n${RED}%s${NC}\n\n" "    normal user. You will be asked for a sudo password when necessary."
        exit 1
    fi
}


_error () {
    clear
    printf "ERROR: %s\n" "$1" >&2
    exit 1
}


_clean () {
    if [[ -L $1 ]]; then
        unlink $1
    else
        mv $1 $RESTORE
    fi
}


_backup () {
    # bash
    [[ -f $HOME/.bash_aliases ]] && _clean $HOME/.bash_aliases
    [[ -f $HOME/.bash_functions ]] && _clean $HOME/.bash_functions
    [[ -f $HOME/.bash_logout ]] && _clean $HOME/.bash_logout
    [[ -f $HOME/.bash_profile ]] && _clean $HOME/.bash_profile
    [[ -f $HOME/.bashrc ]] && _clean $HOME/.bashrc
    [[ -f $HOME/.profile ]] && _clean $HOME/.profile
    # ---
    # bin
    [[ -d $HOME/bin ]] && _clean $HOME/bin
    # ---
    # fzf
    [[ -d $HOME/.config/fzf ]] && _clean $HOME/.config/fzf
    # ---
    # tmux
    [[ -f $HOME/.tmux.conf ]] && _clean $HOME/.tmux.conf
    # ---
    # vim
    [[ -f $HOME/.vimrc ]] && _clean $HOME/.vimrc
}




### Start installing
####################

clear
_banner
_warning


if ! uname -a | grep -qE 'Debian' &> /dev/null; then
    read -p "    WARNING: this is not a Debian distro (enter to continue)"
    echo
fi


if [[ ! -d $HOME/.minidot-restore ]]; then
    mkdir $HOME/.minidot-restore
    RESTORE="$HOME/.minidot-restore"
else
    printf "    '.minidot' is already setup\n"
    printf "    Launch ./restore.sh first\n\n"
    exit 1
fi


read -p "    Confirm to start the '.minidot' setup script (enter to continue)"
printf "\n"




### Syncing
###########

read -p "    Syncing and updating repos (enter to continue)"
printf "\n"
# ---
sudo apt-get update && sudo apt-get upgrade -qq -y || _error "syncing repos"




### Utilities
#############

printf "\n"
read -p "    Installing packages (enter to continue)"
printf "\n"
# ---
sudo apt-get install -qq -y \
    git \
    curl \
    wget \
    stow \
    xclip \
    trash-cli \
    htop \
    fzf \
    ripgrep \
    bat \
    chafa \
    poppler-utils \
    wamerican \
    witalian \
    dash \
    bash \
    bash-completion \
    tmux \
    vim-gtk3 \
    micro \
    exuberant-ctags \
    fonts-firacode \
    pandoc \
    gnome-keyring




### Backup + symlinks + ~/.bash_extras
######################################

_backup
# ---
stow bash
stow bin
stow fzf
stow tmux
stow vim
# ---
cat <<EOT > $HOME/.bash_extras
### System fetcher (sfetch/mfetch)
##################################

[[ -f $HOME/bin/fetchers/sfetch ]] && $HOME/bin/fetchers/sfetch




### Chafa logo (uncomment and set LOGO path)
############################################

# CHAFA="/bin/chafa --dither diffusion --dither-grain 1 --dither-intensity 10 --size 25x25"
# LOGO="$HOME/.minidot/debian.svg"
# ${CHAFA} "${LOGO}"




### Prompt mode (uncomment to override vi with emacs)
#####################################################

# set -o emacs




### Default editor (uncomment to override vi with micro)
########################################################

# export EDITOR="/bin/micro"
# export VISUAL="/bin/micro"
EOT




### Finish
##########

printf "\n"
printf "    Installation completed ;)\n"
