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




## More&nbsp;tools

Since *Minidot* is so minimal, here are some (cross&#x2011;platform) extra tools you might find useful:

- [Google&nbsp;Chrome](https://www.google.com/chrome/): most popular web&#x2011;browser
- [Brave&nbsp;Browser](https://brave.com/): faster, more private Chromium&#x2011;based web browser
- [Visual&nbsp;Studio&nbsp;Code](https://code.visualstudio.com/): Microsoft source&#x2011;code editor
- [GitKraken&nbsp;Client](https://www.gitkraken.com/): world's most powerful suite of Git&#x2011;tools
- [Alacritty&nbsp;Terminal](https://alacritty.org/): fast and flexible OpenGL terminal&#x2011;emulator




### Linux&#x2011;specific

Other than your classic [GNOME&nbsp;Apps](https://apps.gnome.org), you might consider the following:

- [Input&nbsp;Remapper](https://github.com/sezanzeb/input-remapper#readme): simple tool to change the behaviour of your input devices
- [Extension&nbsp;Manager](https://github.com/mjakeman/extension-manager#readme): browser/installer for GNOME&#x2011;Shell extensions




### Nerd&nbsp;Fonts

If you need to use a font with glyphs, you can install one of the Nerd Fonts available:

1. download a [Nerd&nbsp;Font](https://www.nerdfonts.com/font-downloads)
2. unzip and copy it inside `~/.fonts` or `~/.local/share/fonts`
3. run the command `fc-cache -fv` to manually rebuild the font cache




### Chrome&nbsp;extensions

For any of the Chromium&#x2011;based browsers, here's some useful extension to start with:

- [Ublock&nbsp;Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm): efficient blocker, easy on resources
- [Free&nbsp;VPN](https://chrome.google.com/webstore/detail/free-vpn-for-chrome-vpn-p/majdfhpaihoncoakbjgbdhglocklcgno): fast and secure VPN service
- [DeepL&nbsp;Translate](https://chrome.google.com/webstore/detail/deepl-translate-reading-w/cofdbpoegempjloogbagkncekinflcnj): accurate language tranlsator
- [Tabliss](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp): customizable new&#x2011;tab page, with [presets](https://raw.githubusercontent.com/matteogiorgi/.minidot/master/tabliss.json)
- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb): Vim&#x2011;like keyboard shortcuts
