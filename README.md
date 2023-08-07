# A super-portable Gnu/Linux setup

This repo contains a mini (and very portable) configuration of my *dotfiles*. They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download) or [Ubuntu](https://ubuntu.com/#download) and they are organized using [GNU Stow](https://www.gnu.org/software/stow/). The scripts are in good order and well readable but there wont be no more than the bare essentials.

<img src="vim.png" width="100%">

- Debian [packages](https://www.debian.org/distrib/packages) and [manpages](https://manpages.debian.org/)
- Ubuntu [packages](https://packages.ubuntu.com/) and [manpages](https://manpages.ubuntu.com/)

Minidot is intended batteries-included as it is, but if you want [more](https://apps.gnome.org/), you can always rely on `apt` (or [`snap`](https://snapcraft.io/docs/installing-snapd)) or download any deb package and install it with `dpkg`. Here some useful tools: [Sublime-Text](https://www.sublimetext.com/docs/linux_repositories.html), [Sublime-Merge](https://www.sublimemerge.com/docs/linux_repositories), [Visual-Studio-Code](https://code.visualstudio.com/Download), [Visual-Studio-Code-Insiders](https://code.visualstudio.com/insiders/), [Google-Chrome](https://www.google.com/chrome/), [Brave](https://brave.com/linux/), [Extension-Manager](https://github.com/mjakeman/extension-manager#-installing), [Input-Remapper](https://github.com/sezanzeb/input-remapper#installation).




## Packages

```
git curl wget stow htop xclip trash-cli fzf ripgrep bat chafa poppler-utils fonts-firacode
pandoc wamerican witalian gnome-keyring dash bash bash-completion tmux vim-gtk3 exuberant-ctags
```
