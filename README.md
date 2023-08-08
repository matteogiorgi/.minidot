# A super-portable Gnu/Linux setup

This repo contains a mini (and very portable) configuration of my *dotfiles*. They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download) or [Ubuntu](https://ubuntu.com/#download) and they are organized using [GNU Stow](https://www.gnu.org/software/stow/). The scripts are in good order and well readable but there wont be no more than the bare essentials.

Minidot is a ready-2-go, batteries-included, blazingly-fast, lightweight work environment, but if you feel you need [more](https://apps.gnome.org/), you can always rely on `apt` (or [`snap`](https://snapcraft.io/docs/installing-snapd)) or download any deb package and install it with `dpkg`.

Here some useful tools to consider: [Sublime-Text](https://www.sublimetext.com/docs/linux_repositories.html), [Sublime-Merge](https://www.sublimemerge.com/docs/linux_repositories), [Visual-Studio-Code](https://code.visualstudio.com/Download), [Visual-Studio-Code-Insiders](https://code.visualstudio.com/insiders/), [Google-Chrome](https://www.google.com/chrome/), [Brave](https://brave.com/linux/), [Extension-Manager](https://github.com/mjakeman/extension-manager#-installing), [Input-Remapper](https://github.com/sezanzeb/input-remapper#installation).

<img src="vim.png" width="100%">




## Packages

```
git curl wget stow htop xclip trash-cli fzf ripgrep bat chafa poppler-utils fonts-firacode
pandoc wamerican witalian gnome-keyring dash bash bash-completion tmux vim-gtk3 exuberant-ctags
```

For a detailed list of all the available packages, check out Debian and Ubuntu related pages: [click](https://www.debian.org/distrib/packages), [clack](https://packages.ubuntu.com).
