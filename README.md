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
sudo apt-get update
sudo apt-get install -qq -y vim-gtk3
```

My current configuration does not use any external plugin since Vim is already a very powerful editor by itself. If you need to install some plugins, you can do so by cloning their repo inside `~/.vim/pack/plugins/start/`: the plugins will be loaded automatically at startup and can be updated with the `git pull` command.




## Need something else?

This repo already contains all the tools you need to work proficiently but, if you want [more](https://apps.gnome.org/), you can always rely on `apt` (or `snap`) or download the official deb package and install it through `dpkg`.

> [`helix`](https://docs.helix-editor.com/install.html), [`code`](https://code.visualstudio.com/Download), [`code-insiders`](https://code.visualstudio.com/insiders/)\
[`google-chrome`](https://www.google.com/chrome/), [`brave`](https://brave.com/linux/)\
[`extension-manager`](https://mattjakeman.com/apps/extension-manager), [`input-remapper`](https://github.com/sezanzeb/input-remapper#installation).




## Docs

- Packages: [debian.org/distrib/packages](https://www.debian.org/distrib/packages) or [packages.ubuntu.com](https://packages.ubuntu.com/).
- Manpages: [manpages.debian.org](https://manpages.debian.org/) or [manpages.ubuntu.com](https://manpages.ubuntu.com/).
