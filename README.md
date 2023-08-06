# A super-portable Gnu/Linux setup

This repo contains a mini (and very portable) configuration of my *dotfiles*. They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download) or [Ubuntu](https://ubuntu.com/#download) and they are organized using [GNU Stow](https://www.gnu.org/software/stow/). The scripts are in good order and well readable but there wont be no more than the bare essentials.

<img src="vim.png" width="100%">




## Packages

```
git curl wget stow htop xclip trash-cli fzf ripgrep bat chafa poppler-utils fonts-firacode
pandoc wamerican witalian gnome-keyring dash bash bash-completion tmux vim-gtk3 exuberant-ctags
```




## Snap

[Snap](https://snapcraft.io/) comes pre-installed and ready to go on all recent releases of Ubuntu but if, for any reason, it is not, you can follow the instructions on the [Snapcraft documentation](https://snapcraft.io/docs/installing-snapd) and intall it with:

```bash
sudo apt-get update
sudo apt-get install -qq -y snapd
```

Then log out and back in again (to ensure snap’s paths are updated correctly) and install the `core` snap in order to get the latest `snapd`:

```bash
sudo snap install core
```




## Vim

If you are in Ubuntu, [Vim](https://www.vim.org/) can be easily moved to the latest version by adding the unofficial [Vim PPA repo](https://launchpad.net/~jonathonf/+archive/ubuntu/vim?ref=itsfoss.com) and upgrading `vim-gtk3` package like this:

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install -qq -y vim-gtk3
```

My current configuration does not use any external plugin since Vim is already a very powerful editor by itself. If you need to install some plugins, you can do so by cloning their repo inside `~/.vim/pack/plugins/start/`: the plugins will be loaded automatically at startup and eventually can be updated with the `git pull` command.

Vim-Minidot is of course compatible with [Neovim](https://neovim.io/) too. So, to easily set up your goto configuration, just fire `nvim` and create the `init.vim (user config)` file as specified in the [Neovim documentation](https://neovim.io/doc/user/nvim.html):

```
:exe 'edit '.stdpath('config').'/init.vim'
:write ++p
```

Then add the following three lines to the newly created file and *Bob's your uncle*.

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```




## Docs

- Packages: [debian.org/distrib/packages](https://www.debian.org/distrib/packages) or [packages.ubuntu.com](https://packages.ubuntu.com/).
- Manpages: [manpages.debian.org](https://manpages.debian.org/) or [manpages.ubuntu.com](https://manpages.ubuntu.com/).




## Need something else?

This repo already contains all the tools you need to work proficiently but, if you want [more](https://apps.gnome.org/), you can always rely on `apt` (or `snap`) or download the official deb package and install it through `dpkg`. Here few goodies: [`sublime`](https://www.sublimetext.com/docs/linux_repositories.html), [`merge`](https://www.sublimemerge.com/docs/linux_repositories), [`code`](https://code.visualstudio.com/Download), [`insiders`](https://code.visualstudio.com/insiders/), [`google-chrome`](https://www.google.com/chrome/), [`brave`](https://brave.com/linux/), [`extension-manager`](https://github.com/mjakeman/extension-manager#-installing), [`input-remapper`](https://github.com/sezanzeb/input-remapper#installation).
