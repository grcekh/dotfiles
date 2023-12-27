Alternative macOS app icons for WezTerm created by [@gf3](https://github.com/gf3) and [@mikker](https://github.com/mikker):

- https://github.com/wez/wezterm/discussions/2396
- https://github.com/mikker/wezterm-icon

### Installation

To convert a PNG file to Apple ICNS format and update the application icon:

```
scripts/icns.sh WezTerm wezterm.png
```

To skip the file conversion and update the application icon directly:

```
scripts/icns.sh WezTerm wezterm.icns
```

### Manual installation

1. Convert the PNG file to Apple ICNS format:

```sh
npx png2icons wezterm.png wezterm -icns
```

2. Find `WezTerm.app` in the `Applications` folder, select it, and press `⌘ + i`.
3. Drag `wezterm.icns` to the application icon in the info pane.
4. Delete the icon cache and relaunch Finder and Dock:

```sh
rm /var/folders/*/*/*/com.apple.dock.iconcache
rm -r /var/folders/*/*/*/com.apple.iconservices*
killall Finder
killall Dock
```
