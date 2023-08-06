# A super-portable Gnu/Linux setup

This repo contains a mini (and very portable) configuration of my *dotfiles*. They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download) or [Ubuntu](https://ubuntu.com/#download) and they are organized using [GNU Stow](https://www.gnu.org/software/stow/). The scripts are in good order and well readable but there wont be no more than the bare essentials.

<img src="vim.png" width="100%">




## Packages

```
git curl wget stow htop xclip trash-cli fzf ripgrep bat chafa poppler-utils fonts-firacode
pandoc wamerican witalian gnome-keyring dash bash bash-completion tmux vim-gtk3 exuberant-ctags
```




## Snap

Snap comes pre-installed and ready to go on all recent releases of Ubuntu but if, for any reason, it is not, you can follow the instructions on [Snapcraft](https://snapcraft.io/docs/installing-snapd) and intall it with:

```bash
sudo apt-get update
sudo apt-get install -qq -y snapd
```

Log out and back in again (to ensure snap’s paths are updated correctly), than use the following command to install the `core` snap for the latest `snapd` and Bob's your uncle.

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

My current configuration does not use any external plugin since Vim is already a very powerful editor by itself. If you need to install some plugins, you can do so by cloning their repo inside `~/.vim/pack/plugins/start/`: the plugins will be loaded automatically at startup and can be updated with the `git pull` command.




## Docs

- Packages: [debian.org/distrib/packages](https://www.debian.org/distrib/packages) or [packages.ubuntu.com](https://packages.ubuntu.com/).
- Manpages: [manpages.debian.org](https://manpages.debian.org/) or [manpages.ubuntu.com](https://manpages.ubuntu.com/).

Minidot is intended batteries-included as it is but, if you want [more](https://apps.gnome.org/), you can always rely on `apt` (or `snap`) or download any deb package and install it with `dpkg`. Here few goodies: [Sublime-Text](https://www.sublimetext.com/docs/linux_repositories.html), [Sublime-Merge](https://www.sublimemerge.com/docs/linux_repositories), [Visual-Studio-Code](https://code.visualstudio.com/Download), [Visual-Studio-Code-Insiders](https://code.visualstudio.com/insiders/), [Google-Chrome](https://www.google.com/chrome/), [Brave](https://brave.com/linux/), [Extension-Manager](https://github.com/mjakeman/extension-manager#-installing), [Input-Remapper](https://github.com/sezanzeb/input-remapper#installation).
