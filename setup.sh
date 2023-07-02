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
    printf "\n${YLW}%s${NC}"          "     __  __ ___ _   _ ___ ____   ___ _____ "
    printf "\n${YLW}%s ${RED}%s${NC}" "    |  \/  |_ _| \ | |_ _|  _ \ / _ \_   _|" "  Matteo Giorgi (Geoteo)"
    printf "\n${YLW}%s ${RED}%s${NC}" "    | |\/| || ||  \| || || | | | | | || |  " "  https://www.geoteo.net"
    printf "\n${YLW}%s ${RED}%s${NC}" "    | |  | || || |\  || || |_| | |_| || |  " "  https://github.com/matteogiorgi/.minidot"
    printf "\n${YLW}%s${NC}\n\n"      "    |_|  |_|___|_| \_|___|____/ \___/ |_|  "
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
    [[ -f $HOME/.git-prompt.sh ]] && _clean $HOME/.git-prompt.sh
    [[ -f $HOME/.profile ]] && _clean $HOME/.profile

    # bin
    [[ -d $HOME/bin ]] && _clean $HOME/bin

    # fzf
    [[ -d $HOME/.config/fzf ]] && _clean $HOME/.config/fzf

    # tmux
    [[ -f $HOME/.tmux.conf ]] && _clean $HOME/.tmux.conf

    # vim
    [[ -d $HOME/.vim ]] && _clean $HOME/.vim
    [[ -f $HOME/.vimrc ]] && _clean $HOME/.vimrc
    [[ -f $HOME/.gvimrc ]] && _clean $HOME/.gvimrc
}




### Start installing
####################

clear
_banner
_warning

if ! uname -a | grep -qE 'Debian|Ubuntu' &> /dev/null; then
    read -p "    WARNING: this is not a Debian or Ubuntu distro (enter to continue)"
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

sudo apt-get update && sudo apt-get upgrade -qq -y || _error "syncing repos"




### Utilities
#############

printf "\n"
read -p "    Installing packages (enter to continue)"
printf "\n"

sudo apt-get install -qq -y \
    git \
    curl \
    wget \
    stow \
    htop \
    xclip \
    trash-cli \
    fzf \
    ripgrep \
    bat \
    chafa \
    xdo \
    poppler-utils \
    fonts-firacode \
    wamerican \
    witalian \
    gnome-keyring \
    dash \
    bash \
    bash-completion \
    tmux \
    vim-gtk3 \
    exuberant-ctags \
    pandoc




### Backup + add symlinks
#########################

_backup

stow bash
stow bin
stow fzf
stow tmux
stow vim




### Finish
##########

read -p "    Installation completed ;)"
printf "\n"
