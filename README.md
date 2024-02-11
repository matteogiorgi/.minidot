# Mini&#x2011;dotfiles

```
       .-.        __  __ _       _     _       _
    __/   (      |  \/  (_)_ __ (_) __| | ___ | |_
  , '-.____\     | |\/| | | '_ \| |/ _' |/ _ \| __|
   u=='/  \      | |  | | | | | | | (_| | (_) | |_
      /_/  \     |_|  |_|_|_| |_|_|\__,_|\___/ \__|
    .-''   |
   (  ____/__    If they are minimal, we are mini.
```

This repo contains a streamlined configuration of my dotfiles, designed to work with any Linux distribution based on [Debian](https://www.debian.org)/[Ubuntu](https://ubuntu.com) or within a Linux subsystem, such as [Microsoft WSL](https://learn.microsoft.com/en-us/windows/wsl) or [ChromeOS LDE](https://support.google.com/chromebook/answer/9145439?hl=en).

Just run `setup.sh`/`restore.sh` scripts. The setup will backup any of your old configs, install all the packages needed and symlink the *Minidot* files correctly; while the restore script will rollback all the changes and reinstate your previously saved config files.

<img src="vim.png" width="100%">




<!-- ## Packages & docs -->

<!-- ``` -->
<!-- git curl wget stow xclip trash-cli htop fzf ripgrep bat chafa poppler-utils -->
<!-- wamerican witalian dash bash bash-completion tmux vim-gtk3 exuberant-ctags -->
<!-- fonts-firacode pandoc gnome-keyring -->
<!-- ``` -->

<!-- For a detailed list of all the available packages, check out Debian and Ubuntu related pages [here](https://www.debian.org/distrib/packages) and [there](https://packages.ubuntu.com). Further documentation about *Minidot* can be found inside [**`DOCS.md`**](DOCS.md), take a look for more info. -->




<!-- # Mini&#x2011;documentation -->

<!-- ``` -->
<!--        .-.        __  __ _       _     _ -->
<!--     __/   (      |  \/  (_)_ __ (_) __| | ___   ___ -->
<!--   , '-.____\     | |\/| | | '_ \| |/ _' |/ _ \ / __| -->
<!--    u=='/  \      | |  | | | | | | | (_| | (_) | (__ -->
<!--       /_/  \     |_|  |_|_|_| |_|_|\__,_|\___/ \___| -->
<!--     .-''   | -->
<!--    (  ____/__    Not a real doc. -->
<!-- ``` -->

<!-- Just run `setup.sh`/`restore.sh` scripts. The setup will backup any of your old configs, install all the packages needed and symlink the *Minidot* files correctly; while the restore script will rollback all the changes and reinstate your previously saved config files. -->

<!-- <img src="doc.png" width="100%"> -->




## More&nbsp;tools

Since *Minidot* is so minimal, here are some extra tools you might find useful:

- [Brave](https://brave.com/): fast Chromium&#x2011;based web browser
- [VSCode](https://code.visualstudio.com/): Microsoft source&#x2011;code editor
- [Alacritty](https://alacritty.org/): fast and flexible OpenGL terminal emulator
- [Xournal++](https://xournalpp.github.io/): notetaking app with PDF annotation support
- [LXD](https://ubuntu.com/lxd): modern Linux container menagement tool
- [Remapper](https://github.com/sezanzeb/input-remapper#readme): simple Linux input device controller




### Chrome&nbsp;extensions

For any of the Chromium&#x2011;based browsers, here's some useful extension to start with:

- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb): Vim&#x2011;like keyboard shortcuts
- [Tabliss](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp): customizable new&#x2011;tab page, with [presets](https://raw.githubusercontent.com/matteogiorgi/.minidot/master/tabliss.json)
- [Ublock](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm): efficient blocker, easy on resources
- [1VPN](https://chromewebstore.google.com/detail/1vpn-free-vpn/akcocjjpkmlniicdeemdceeajlmoabhg?utm_source=ext_app_menu): fast and secure VPN service
