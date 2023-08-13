#!/usr/bin/env bash

# This script just resets your Helix config Vin-like
# as specified in https://github.com/LGUG2Z/helix-vim.




### Ready?
##########

read -p "Resetting Helix (enter to continue)"




### Check for Helix
###################

if [[ ! -x "$(command -v "hx")" ]]; then
    printf "\n"
    printf "═══════ Warning ═══════\n"
    printf "Helix not yet installed\n"
    exit 1
fi




### Clear Helix config
######################

HELIX="$HOME/.config/helix"
# ---
rm -rf "$HELIX"
mkdir -p "$HELIX/themes"
# ---
cat "${HOME}/bin/resetters/hevi/config.toml" > "${HELIX}/config.toml"
cat "${HOME}/bin/resetters/hevi/hevi.toml" > "${HELIX}/themes/hevi.toml"




### Final message
#################

printf "\n"
printf "═════════ We're done here ════════\n"
printf "Enjoy your post-modern text editor\n"
