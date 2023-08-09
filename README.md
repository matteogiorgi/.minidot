# Your ultimate Gnu/Linux setup

This repo contains a mini configuration of my dotfiles (hence *minidot*). They are meant to be used alongside a vanilla install of [Debian](https://www.debian.org/download)/[Ubuntu](https://ubuntu.com/#download) or inside a linux subsystem such as the [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install) or the [ChromeOS Linux Development Environment](https://support.google.com/chromebook/answer/9145439?hl=en). All is organized using [GNU Stow](https://www.gnu.org/software/stow/) and the code is in good order and well readable but there wont be no more than the bare essentials.

Minidot is a ready-2-go, batteries-included, blazingly-fast, ultra-lightweight work environment and you do not need any extra bloat to be productive, but if you really feel the urge to add [more gear](https://apps.gnome.org/), you can always rely on `apt` (or [`snap`](https://snapcraft.io/docs/installing-snapd)) or download any deb package and install it with `dpkg`.

<img src="vim.png" width="100%">




## Happy?

What is wrong mate, you are not quite comfortable with such a minimal-giga-chad workflow? Do you fancy some extra-tools? All righ then, put down your double soy-latte-macchiato and take a look at this stuff, you might find them useful:

- [Sublime-Text](https://www.sublimetext.com/docs/linux_repositories.html)
- [Sublime-Merge](https://www.sublimemerge.com/docs/linux_repositories)
- [Visual-Studio-Code](https://code.visualstudio.com/Download)
- [Visual-Studio-Code-Insiders](https://code.visualstudio.com/insiders/)
- [Google-Chrome](https://www.google.com/chrome/)
- [Brave-Browser](https://brave.com/linux/)
- [Extension-Manager](https://github.com/mjakeman/extension-manager#-installing)
- [Input-Remapper](https://github.com/sezanzeb/input-remapper#installation)




## Packages

```
git curl wget stow htop xclip trash-cli fzf ripgrep bat chafa poppler-utils fonts-firacode
pandoc wamerican witalian gnome-keyring dash bash bash-completion tmux vim-gtk3 exuberant-ctags
```

For a detailed list of all the available packages, check out Debian and Ubuntu related pages [here](https://www.debian.org/distrib/packages) and [there](https://packages.ubuntu.com).
