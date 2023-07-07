# A super-portable Gnu/Linux setup

This repo contains a mini (and very portable) configuration of my *dotfiles*. They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download) or [Ubuntu](https://ubuntu.com/#download) and they are organized using [GNU Stow](https://www.gnu.org/software/stow/). The scripts are in good order and well readable but there wont be no more than the bare essentials.

<img src="vim.png" width="100%">




## Packages included

```
git curl wget stow htop xclip trash-cli fzf ripgrep bat chafa poppler-utils fonts-firacode
wamerican witalian gnome-keyring dash bash bash-completion tmux vim-gtk3 exuberant-ctags pandoc
```




## Vim Tweaks

With Ubuntu, [Vim](https://www.vim.org/) can be easily moved to the latest version by adding the unofficial [Vim PPA repo](https://launchpad.net/~jonathonf/+archive/ubuntu/vim?ref=itsfoss.com) and upgrading `vim-gtk3` package like this:

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update && sudo apt-get install vim-gtk3
```

My current configuration does not use any external plugin since Vim is already a very powerful editor by itself. If you need to install some plugins, you can do so by cloning their repo inside `~/.vim/pack/plugins/start/`: the plugins will be loaded automatically at startup and can be updated with the `git pull` command.




## Need something else?

- Gnome: `dconf-editor`, `gnome-shell-extension-manager`, `gnome-shell-extensions`, `chrome-gnome-shell`.
- Tools: `gparted`, `input-remapper`, `diodon`, `vlc`, 'gitg', `zim`, [`xournalpp`](https://xournalpp.github.io/installation/linux/), [`brave`](https://brave.com/linux/), [`chrome`](https://www.google.com/chrome/), [`code`](https://code.visualstudio.com/Download), [`insiders`](https://code.visualstudio.com/insiders/).
- Extensions: [uBlock](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en-US), [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en-US), [Player](https://chrome.google.com/webstore/detail/mediaplayer-video-and-aud/mgmhnaapafpejpkhdhijgkljhpcpecpj?hl=en-US), [DeepL](https://chrome.google.com/webstore/detail/deepl-translate-reading-w/cofdbpoegempjloogbagkncekinflcnj), [Onion](https://chrome.google.com/webstore/detail/onion-browser-button/fockhhgebmfjljjmjhbdgibcmofjbpca?hl=en-US), [Veepn](https://chrome.google.com/webstore/detail/free-vpn-for-chrome-vpn-p/majdfhpaihoncoakbjgbdhglocklcgno/related?hl=en-US), [Gnome](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep/related), [123Apps](https://chrome.google.com/webstore/detail/web-apps-by-123apps/dpplndkoilcedkdjicmbeoahnckdcnle).
- Bookmarks: [Startpage Devdocs Drive Mega Gmail Proton Outlook Discord Telegram](https://raw.githubusercontent.com/matteogiorgi/.minidot/master/bookmarks.html)




## Docs

- Packages: [debian.org/distrib/packages](https://www.debian.org/distrib/packages) or [packages.ubuntu.com](https://packages.ubuntu.com/).
- Manpages: [manpages.debian.org](https://manpages.debian.org/) or [manpages.ubuntu.com](https://manpages.ubuntu.com/).
