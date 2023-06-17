#!/usr/bin/env bash

# This '.minidot' restore script will restore whatever previous
# configuration there was before `setup.sh` was launched.




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

_restore () {
    # bash
    [[ -f $RESTORE/.bash_aliases ]] && mv $RESTORE/.bash_aliases $HOME
    [[ -f $RESTORE/.bash_functions ]] && mv $RESTORE/.bash_functions $HOME
    [[ -f $RESTORE/.bash_logout ]] && mv $RESTORE/.bash_logout $HOME
    [[ -f $RESTORE/.bash_profile ]] && mv $RESTORE/.bash_profile $HOME
    [[ -f $RESTORE/.bashrc ]] && mv $RESTORE/.bashrc $HOME
    [[ -f $RESTORE/.git-prompt.sh ]] && mv $RESTORE/.git-prompt.sh $HOME
    [[ -f $RESTORE/.profile ]] && mv $RESTORE/.profile $HOME

    # bin
    [[ -d $RESTORE/bin ]] && mv $RESTORE/bin $HOME

    # fzf
    [[ -d $RESTORE/fzf ]] && mv $RESTORE/fzf $HOME/.config

    # tmux
    [[ -f $RESTORE/.tmux.conf ]] && mv $RESTORE/.tmux.conf $HOME

    # vim
    [[ -d $RESTORE/.vim ]] && mv $RESTORE/.vim $HOME
    [[ -f $RESTORE/.vimrc ]] && mv $RESTORE/.vimrc $HOME
    [[ -f $RESTORE/.gvimrc ]] && mv $RESTORE/.gvimrc $HOME
}




### Start uninstalling
######################

clear
_banner
_warning

if ! uname -a | grep -qE 'Debian|Ubuntu' &> /dev/null; then
    read -p "    WARNING: this is not a Debian or Ubuntu distro (enter to continue)"
    echo
fi

if [[ -d $HOME/.minidot-restore ]]; then
    RESTORE="$HOME/.minidot-restore"
else
    printf "    Nothing to restore\n"
    printf "    Launch ./setup.sh first\n\n"
    exit 1
fi

read -p "    Confirm to start the '.minidot' restore script (enter to continue)"
printf "\n"




### Remove symlinks
###################

stow -D bash
stow -D bin
stow -D fzf
stow -D tmux
stow -D vim

_restore
[[ -d $RESTORE ]] && rm -rf $RESTORE




### Remove packages
###################

printf "\n"
read -p "    Uninstalling packages (enter to continue)"
printf "\n"

# the following packages aren't going to be uninstalled:
# gnome-keyring, dash, bash, bash-completion.
sudo apt purge -qq -y \
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
    tmux \
    vim-gtk3




### Autoremove
##############

printf "\n"
read -p "    Launching autoremove (enter to continue)"
printf "\n"

sudo apt autoremove -qq -y || _error "autoremove"




### Finish
##########

printf "\n"
read -p "    Restoring completed ;)"
printf "\n"
