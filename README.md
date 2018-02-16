# Universal Emacs Keybindings

Scripts that bring **most** Emacs keybindings to Mac OSX and Windows.

## Features

* Ctrl-Space space be used to preform Emacs style text selection in other apps
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

Namespaces are used inside `keys` send different keys to different apps.

`globalEmacs` sends Emacs like keybindings to all non-Emacs apps
`globalOverride` overrides Emacs and all apps
`appName/execName` sends app specific overrides

### The `keys` syntax and mark sentivitiy

Keybindings are structured in the following pattern:

1. Namespace
2. Source modifier keys such as `ctrl, alt, alt+shift, ...`
3. Source non-modifier key such as `a,b,c, space, /, ...`
4. Destination Modifiers and non-modifiers keys
5. A boolean indicating if the keybinding will maintain a text selection
6. Run a macro to run instead of a translating a keys

### Windows AutoHotkey keys syntax example

```
"globalEmacs" : { "ctrl" { "a": ["{Home}", True, ""] } }
```

1. `globalEmacs` means this keybinding is for all non-Emacs apps
2. Translate the modifier key `Ctrl`
3. Translate the key `a`
4. Destination keys are `Home`
5. `True` tells the script to maintain the current text selection if currently selecting
6. No macro to run for this keybinding

### Mac OSX hammerspoon keys syntax example

```
['globalEmacs'] = { ["ctrl"] = { ['delete'] = {nil, nil, false, 'macroBackwardsKillWord'} } }
```

1. `globalEmacs` means this keybinding is for all non-Emacs apps
2. Translate the modifier key `Ctrl`
3. Translate the key `delete` (or Backspace)
4. No destination modifier or key
5. `false` tells the script to cancel a text selection if already started
6. run the macro `macroBackwardsKillWord` (which runs multiple keys presses)

### Leave apps that already have Emacs keybindings alone

In Hammerspoon add name of your app to the following list:

```
local appsWithNativeEmacsKeybindings = { 'emacs', 'terminal' }
```

In Autohotkey add the name of your app's exec to the following list:

```
global appsWithNativeEmacsKeybindings = ["emacs.exe", "conemu64.exe"]
```

## These scripts were inspired by

* https://gist.github.com/dulm/ee5ec47cfd2a71ded0e3841ee04e6ea3
* https://github.com/usi3/emacs.ahk
