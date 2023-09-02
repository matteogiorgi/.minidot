# Minidoc

```
       .-.        __  __ _       _     _       _
    __/   (      |  \/  (_)_ __ (_) __| | ___ | |_
  , '-.____\     | |\/| | | '_ \| |/ _` |/ _ \| __|
   u=='/  \      | |  | | | | | | | (_| | (_) | |_
      /_/  \     |_|  |_|_|_| |_|_|\__,_|\___/ \__|
    .-''   |
   (  ____/__    a mini-doc for your mini-dot
```




## Install/Uninstall

Just run `setup.sh`/`restore.sh` scripts. The setup will backup any of your old configs, install all the packages needed and symlink the *Minidot* files correctly; while the restore script will rollback all the changes and reinstate your previously saved config files.




## Linux system container manager

In case you do not want to mess around with your current configuration or just feel the need to containerize your work environment, you can install *Minidot* inside a container. [LXD](https://ubuntu.com/lxd) is an excellent solution and has a very good documentation too: take a look at its [first&#x2011;steps](https://documentation.ubuntu.com/lxd/en/latest/tutorial/first_steps/#first-steps) page, it's very easy to follow and will get you up and running in no time.




## Nerd Fonts

If you need to use a font with glyphs, you can install one of the Nerd Fonts available:

1. download a [Nerd Font](https://www.nerdfonts.com/font-downloads)
2. unzip and copy it inside `~/.fonts` or `~/.local/share/fonts`
3. run the command `fc-cache -fv` to manually rebuild the font cache




## More tools

Since *Minidot* is so minimal, here are some extra tools you might find useful:

- [AstroNvim](https://astronvim.com/#%EF%B8%8F-installation): an aesthetic and feature&#x2011;rich Neovim config
- [VSCode](https://code.visualstudio.com/Download): Microsoft source&#x2011;code editor
- [VSCode&#x2011;Insiders](https://code.visualstudio.com/insiders/): pre&#x2011;release build of VSCode
- [Sublime&#x2011;Text](https://www.sublimetext.com/docs/linux_repositories.html): your text editor, done right
- [Sublime&#x2011;Merge](https://www.sublimemerge.com/docs/linux_repositories): a Git client, done Sublime
- [GitKraken](https://www.gitkraken.com/download): the world's most powerful suite of Git tools
- [Google&#x2011;Chrome](https://www.google.com/chrome/): the most popular web browser
- [Brave](https://brave.com/linux/): a faster, more private chromium&#x2011;based web browser
- [Min](https://minbrowser.org/): a minimal and cute web browser that gets out of your way
- [Extension&#x2011;Manager](https://github.com/mjakeman/extension-manager#-installing): a utility for browsing and installing GNOME Shell extensions
- [Input&#x2011;Remapper](https://github.com/sezanzeb/input-remapper#installation): a tool to change the behaviour of your input devices
- [Tilix](https://gnunn1.github.io/tilix-web/#packages): an advanced GTK3 tiling terminal emulator
- [Terminator](https://gnome-terminator.org/): another tiling terminal emulator whith lots of features
