# A super-portable Gnu/Linux setup

This repo contains a mini (and very portable) configuration of my *dotfiles*. They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download) or [Ubuntu](https://ubuntu.com/#download) and they are organized using [GNU Stow](https://www.gnu.org/software/stow/). The scripts are in good order and well readable but there wont be no more than the bare essentials.

<img src="vim.png" width="100%">




## Packages included

```
git curl wget stow htop xclip trash-cli fzf ripgrep bat chafa poppler-utils fonts-firacode
wamerican witalian gnome-keyring dash bash bash-completion tmux vim-gtk3 pandoc
```




## Tweaks

- Bookmarks: [`Startpage Devdocs Drive Mega Gmail Proton Outlook Discord Telegram`](bookmarks.html).
- Chrome extensions: [`uBlock`](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en-US), [`Vimium`](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en-US), [`Player`](https://chrome.google.com/webstore/detail/mediaplayer-video-and-aud/mgmhnaapafpejpkhdhijgkljhpcpecpj?hl=en-US), [`DeepL`](https://chrome.google.com/webstore/detail/deepl-translate-reading-w/cofdbpoegempjloogbagkncekinflcnj), [`Onion`](https://chrome.google.com/webstore/detail/onion-browser-button/fockhhgebmfjljjmjhbdgibcmofjbpca?hl=en-US), [`Veepn`](https://chrome.google.com/webstore/detail/free-vpn-for-chrome-vpn-p/majdfhpaihoncoakbjgbdhglocklcgno/related?hl=en-US), [`Gnome`](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep/related), [`123Apps`](https://chrome.google.com/webstore/detail/web-apps-by-123apps/dpplndkoilcedkdjicmbeoahnckdcnle).




### [Vim 9](https://www.vim.org/vim90.php) via Ubuntu PPA

If using *Ubuntu*, add the unofficial [Vim PPA repo](https://launchpad.net/~jonathonf/+archive/ubuntu/vim?ref=itsfoss.com) and upgrade `vim-gtk3` package like this:

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt install vim-gtk3
```




### Vim plugins

My Vim configuration does not use any external plugin since [Vim](https://www.vim.org/) is already a very powerful editor by itself. If by any chance you need to install some plugins, you can do so by adding them to the `~/.vim/pack/plugins/start/` directory: the plugins will be loaded automatically at startup and can easily be updated with a `git pull` command inside each plugin directory.

- Some famous plugins: [fugitive](https://github.com/tpope/vim-fugitive), [commentary](https://github.com/tpope/vim-commentary), [surround](https://github.com/tpope/vim-surround), [repeat](https://github.com/tpope/vim-repeat), [context](https://github.com/wellle/context.vim), [auto-pairs](https://github.com/jiangmiao/auto-pairs), [ale](https://github.com/dense-analysis/ale), [copilot](https://github.com/github/copilot.vim).




## Need something else?

- More packages: `gnome-shell-extension-prefs`, `dconf-editor`, `chrome-gnome-shell`.
- More applications: `input-remapper`, `diodon`,  `gparted`, `zim`, [`xournalpp`](https://xournalpp.github.io/installation/linux/), [`brave`](https://brave.com/linux/), [`code`](https://code.visualstudio.com/Download).
- To seek info on packages, refere to [debian.org/distrib/packages](https://www.debian.org/distrib/packages) or [packages.ubuntu.com](https://packages.ubuntu.com/).
- Manpages can be found at [manpages.debian.org](https://manpages.debian.org/) or [manpages.ubuntu.com](https://manpages.ubuntu.com/).
