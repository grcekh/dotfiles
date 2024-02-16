# Cascade

A minimalistic and keyboard centered userChrome created by [@andreasgrafen](https://github.com/andreasgrafen/cascade/).

## Installation

1. Type `about:config` into your URL bar. Click on the **I accept the risk** button if you're shown a warning.
2. Seach for **`toolkit.legacyUserProfileCustomizations.stylesheets`** and set it to **`true`**.
3. Go to your profile folder:
    - Linux: `$HOME/.mozilla/firefox/######.default-release/`
    - MacOS: `Users/[USERNAME]/Library/Application Support/Firefox/Profiles/######.default-release`
4. Copy the `chrome` folder into your profile and restart Firefox by navigating to `about:profiles` and clicking the *Restart Normally* button.

## Keyboard Shortcuts

| Windows / Linux                              | MacOS                            | Description                         |
| -------------------------------------------- | -------------------------------- | ----------------------------------- |
| `Ctrl + L`                                   | `Command + L`                    | focuses the URL bar                 |
| `Ctrl + B`                                   | `Command + B`                    | toggles the bookmark sidebar        |
| `Ctrl + Shift + B`                           | `Command + Shift + B`            | toggles the personal toolbar        |
| `Alt + Left Arrow`                           | `Command + Left Arrow`           | navigates backwards in your history |
| `Alt + Right Arrow`                          | `Command + Right Arrow`          | navigates forwards in your history  |
| `Ctrl + T`                                   | `Command + T`                    | opens a new tab                     |
| `Ctrl + Shift + T`                           | `Command + Shift + T`            | reopens the last closed tab         |
| `Ctrl + W`                                   | `Command + W`                    | closes the current tab              |
| `Ctrl + Page Up`<br/>or `Ctrl + Shift + Tab` | `Command + Option + Left Arrow`  | navigates to the previous tab       |
| `Ctrl + Page Down`<br/>or `Ctrl + Tab`       | `Command + Option + Right Arrow` | navigates to the next tab           |

For the full list of shortcuts visit [the official Firefox website](https://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly).
