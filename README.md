# A super-portable Gnu/Linux setup

This repo contains a mini (and very portable) configuration of my *dotfiles*. They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download) or [Ubuntu](https://ubuntu.com/#download) and they are organized using [GNU Stow](https://www.gnu.org/software/stow/). The scripts are in good order and well readable but there wont be no more than the bare essentials.

![](vimmer)




## Packages included

```
dash bash bash-completion tmux vim-gtk3 poppler-utils git curl wget stow htop xclip trash-cli
fzf ripgrep bat chafa xdo xdotool fonts-firacode wamerican witalian gnome-keyring
```




## Tweaks

- Bookmarks: [`Startpage Notewiki Drive Mega Gmail Proton Outlook Discord Telegram`](bookmarks.html).
- Chrome extensions: [`uBlock`](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en-US), [`Vimium`](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en-US), [`Player`](https://chrome.google.com/webstore/detail/mediaplayer-video-and-aud/mgmhnaapafpejpkhdhijgkljhpcpecpj?hl=en-US), [`DeepL`](https://chrome.google.com/webstore/detail/deepl-translate-reading-w/cofdbpoegempjloogbagkncekinflcnj), [`Onion`](https://chrome.google.com/webstore/detail/onion-browser-button/fockhhgebmfjljjmjhbdgibcmofjbpca?hl=en-US), [`Veepn`](https://chrome.google.com/webstore/detail/free-vpn-for-chrome-vpn-p/majdfhpaihoncoakbjgbdhglocklcgno/related?hl=en-US), [`Gnome`](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep/related), [`123Apps`](https://chrome.google.com/webstore/detail/web-apps-by-123apps/dpplndkoilcedkdjicmbeoahnckdcnle).




### Vim 9 via Ubuntu PPA

If using Ubuntu, add the unofficial [Vim PPA repo](https://launchpad.net/~jonathonf/+archive/ubuntu/vim?ref=itsfoss.com) and upgrade `vim-gtk3` package like this:

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt install vim-gtk3
```




## Need more?

- More packages (via package-manager): `gnome-shell-extension-prefs`, `chrome-gnome-shell`, `dconf-editor`, `input-remapper`, `diodon`,  `gparted`, `zim`, `pandoc`.
- More applications: [`xournalpp`](https://xournalpp.github.io/installation/linux/), [`brave`](https://brave.com/linux/), [`code`](https://code.visualstudio.com/Download).
- To seek infos and docs on any package, refere to [debian.org/distrib/packages](https://www.debian.org/distrib/packages) or [packages.ubuntu.com](https://packages.ubuntu.com/).
- Check out manpages at [manpages.debian.org](https://manpages.debian.org/) or [manpages.ubuntu.com](https://manpages.ubuntu.com/).
