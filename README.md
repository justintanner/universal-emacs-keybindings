# Universal Emacs Keybindings

A collection of scripts that bring **most** Emacs keybindings to Mac OSX and Windows.

## Features

* Ctrl-Space space be used to mark and cut text
* Supports Emacs prefix keys such as Ctrl-xs (save)
* Allows you to specify app specific overrides (Google Chrome)
* Apps with native Emacs keybindings are behave as normal

## Installation for Mac OSX

1. Download and install [Hammerspoon](http://www.hammerspoon.org/)
2. Copy `emacs_hammerspoon.lua` to `~/.hammerspoon/init.lua`
3. Launch Hammerspoon

## Installation for Windows

1. Download and Install [AutoHotkey](https://autohotkey.com/)
2. Launch `emacs_autohotkey.ahk` (notice the green system tray icon)
3. Add `emacs_authotkey.ahk` to your Windows startup script. Checkout [this guide](https://www.maketecheasier.com/schedule-autohotkey-startup-windows/).

## Customizing the keybindings

Both Windows and Mac OSX use the global `keys` to configure keybindings.

### Namespaces

Both scripts use namespaces to send different commands to different apps.

`globalEmacs` Emacs like keybinding used in all app except Emacs
`globalOverride` contains keybindings that override all other apps including Emacs

### The `keys` syntax and mark sentivitiy

To bring Emacs style marking and cutting The keybindings use the following pattern:

1. Modifier keys such as `ctrl, alt, alt+shift, ...`
2. Non-modifier key such as `a,b,c, space, /, ...`
3. Modifiers and non-modifiers to translate to
4. Boolean indicating if the keybinding will maintain a mark (aka selection) or cancel the selection
5. A macro to run instead of a keybinding

### Syntax Example (Windows)

```
"globalEmacs" : { "ctrl" { "a": ["{Home}", False, ""] } }
```

This keybinding states, for all apps other than Emacs map Ctrl+a to Home and maintain any mark previously set while editing text.

## These scripts were inspired by

* https://gist.github.com/dulm/ee5ec47cfd2a71ded0e3841ee04e6ea3
* https://github.com/usi3/emacs.ahk
