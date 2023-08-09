# Your ultimate Gnu/Linux setup

This repo contains a streamlined configuration of my dotfiles, aptly named *minidot*. It's designed to work seamlessly with a fresh install of [Debian](https://www.debian.org/download)/[Ubuntu](https://ubuntu.com/#download) or within a Linux subsystem, such as the [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install) or the [ChromeOS Linux Development Environment](https://support.google.com/chromebook/answer/9145439?hl=en).

Use the provided [setup](https://github.com/matteogiorgi/.minidot/blob/master/setup.sh) and [restore](https://github.com/matteogiorgi/.minidot/blob/master/restore.sh) scripts to speed things up and everything will fold into place without breaking a swet. The code is straightforward, well readable and organized with [GNU Stow](https://www.gnu.org/software/stow/), feel free to customize it as you wish.

Minidot offers a ready to use, lightweight work environment and you shouldn't require any additional bloat to be productive, but if you feel the need to add [more gear](https://apps.gnome.org/), you can always use on `apt` (or [`snap`](https://snapcraft.io/docs/installing-snapd)) or download any `.deb` package and install it via `dpkg`.

<img src="vim.png" width="100%">




## Happy?

Not comfortable with a minimal workflow? Put down your *double soy latte macchiato* and take a look at this stuff, it might be useful:

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
