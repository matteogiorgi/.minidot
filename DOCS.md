# Mini&#x2011;documentation

```
       .-.        __  __ _       _     _
    __/   (      |  \/  (_)_ __ (_) __| | ___   ___
  , '-.____\     | |\/| | | '_ \| |/ _' |/ _ \ / __|
   u=='/  \      | |  | | | | | | | (_| | (_) | (__
      /_/  \     |_|  |_|_|_| |_|_|\__,_|\___/ \___|
    .-''   |
   (  ____/__    Not a real doc.
```

Just run `setup.sh`/`restore.sh` scripts. The setup will backup any of your old configs, install all the packages needed and symlink the *Minidot* files correctly; while the restore script will rollback all the changes and reinstate your previously saved config files.

In case you do not want to mess around with your current configuration or just feel the need to containerize your work environment, you can install *Minidot* inside a container: [LXD](https://ubuntu.com/lxd) is an excellent solution. Take a look at its [first&#x2011;steps](https://documentation.ubuntu.com/lxd/en/latest/tutorial/first_steps/#first-steps) page, it's very easy to follow and will get you up and running in no time.

<img src="doc.png" width="100%">




## More tools

Since *Minidot* is so minimal, here are some (multiplatform) extra tools you might find useful:

- [Google&nbsp;Chrome](https://www.google.com/chrome/): most popular web&#x2011;browser
- [Brave&nbsp;Browser](https://brave.com/): faster, more private Chromium&#x2011;based web browser
- [Visual&nbsp;Studio&nbsp;Code](https://code.visualstudio.com/): Microsoft source&#x2011;code editor
- [Helix&nbsp;Editor](https://helix-editor.com/): post modern, kakouneish text&#x2011;editor
- [GitKraken](https://www.gitkraken.com/): world's most powerful suite of Git&#x2011;tools




### Linux&#x2011;specifics

In case you are working in Linux natively, you might also consider the following:

- [Input&nbsp;Remapper](https://github.com/sezanzeb/input-remapper#readme): simple tool to change the behaviour of your input devices
- [Extension&nbsp;Manager](https://github.com/mjakeman/extension-manager#readme): browser/installer for GNOME Shell extensions
- [Tilix&nbsp;Terminal](https://gnunn1.github.io/tilix-web/): advanced GTK3 tiling terminal emulator
- [GNOME&nbsp;Apps](https://apps.gnome.org/): best applications for the GNOME ecosystem




### Nerd Fonts

If you need to use a font with glyphs, you can install one of the Nerd Fonts available:

1. download a [Nerd&nbsp;Font](https://www.nerdfonts.com/font-downloads)
2. unzip and copy it inside `~/.fonts` or `~/.local/share/fonts`
3. run the command `fc-cache -fv` to manually rebuild the font cache
