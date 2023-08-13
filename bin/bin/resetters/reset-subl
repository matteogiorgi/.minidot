#!/usr/bin/env bash

# This script just resets your Sublime Text
# and Merge config: no options, no nothing.




### Ready?
##########

read -p "Resetting Sublime Text/Merge (enter to continue)"




### Reset Sublime-Text folder
#############################

SUBL="$HOME/.config/sublime-text/Packages/User"

if [[ -x "$(command -v "subl")" ]]; then
    rm -rf "$SUBL"
    mkdir -p "$SUBL"
    # ---
    cat "${HOME}/bin/resetters/subl/subl-settings.json" > "${SUBL}/Preferences.sublime-settings"
    cat "${HOME}/bin/resetters/subl/subl-keybindings.json" > "${SUBL}/Default (Linux).sublime-keymap"
    # ---
    if [[ ! -f "$HOME/.local/bin/subl" ]]; then
        if [[ -f "/usr/bin/subl" ]]; then
            ln -s /usr/bin/subl "$HOME/.local/bin/subl"
        elif [[ -f "/snap/bin/subl" ]]; then
            ln -s /snap/bin/subl "$HOME/.local/bin/subl"
        fi
    fi
    # ---
    MESSAGE1="Sublime Text  settings resetted"
else
    MESSAGE1="Sublime Text  not yet installed"
fi




### Reset Sublime-Merge folder
##############################

SMERGE="$HOME/.config/sublime-merge/Packages/User"

if [[ -x "$(command -v "smerge")" ]]; then
    rm -rf "$SMERGE"
    mkdir -p "$SMERGE"
    # ---
    cat "${HOME}/bin/resetters/subl/smerge-settings.json" > "${SMERGE}/Preferences.sublime-settings"
    # ---
    if [[ ! -f "$HOME/.local/bin/smerge" ]]; then
        if [[ -f "/usr/bin/smerge" ]]; then
            ln -s /usr/bin/smerge "$HOME/.local/bin/smerge"
        elif [[ -f "/snap/bin/smerge" ]]; then
            ln -s /snap/bin/smerge "$HOME/.local/bin/smerge"
        fi
    fi
    # ---
    MESSAGE2="Sublime Merge settings resetted"
else
    MESSAGE2="Sublime Merge not yet installed"
fi




### Final message
#################

printf "\n"
printf "═══════ We're done here ═══════\n"
printf "$MESSAGE1\n"
printf "$MESSAGE2\n"
