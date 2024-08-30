# Universal Emacs Keybindings

Use the Emacs keybindings you love across all applications for mac and windows. 

![example image](https://i.imgur.com/oTRCHVh.jpg)

## Features

* Ctrl-Space can be used to preform Emacs style text selection outside of Emacs
* Supports Emacs prefix keys such as Ctrl-xs (save)
* Allows you to specify app specific overrides (Google Chrome)
* Apps with native Emacs keybindings are left alone
* OS specific keybindings are left alone (alt+tab, ctrl+c, cmd+c, etc)

## Update (August 29th 2024)

On Mac I've moved from Hammerspoon to Karabiner, I've left the legacy Hammerspoon script in the repo for reference.

For more information check out my [new blog post](https://jwtanner.com/posts/hammerspoon-to-karabiner/).

## Installation for Mac

1. Download and install [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
2. Select "Universal Emacs Keybindings" from [karabiner configurations](https://ke-complex-modifications.pqrs.org/)
3. Enable the latest version in Karabiner

## Installation for Windows

1. Download and Install [AutoHotkey](https://autohotkey.com/)
2. Launch `emacs_autohotkey.ahk` (notice the green system tray icon)
3. Add `emacs_authotkey.ahk` to your Windows startup script. Checkout [this guide](https://www.maketecheasier.com/schedule-autohotkey-startup-windows/).

### Original post

I wrote a [blog post](https://jwtanner.com/posts/emacs-keybindings-to-rule-them-all/) laying out my reasons for developing these scripts.

## Special thanks to the following scripts for inspiration:

* https://gist.github.com/dulm/ee5ec47cfd2a71ded0e3841ee04e6ea3
* https://github.com/usi3/emacs.ahk
