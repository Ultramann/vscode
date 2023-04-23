# VSCode Configuration

## Change Flow
To make changes to your vscode configuration go through the following steps.

1. Make changes to settings/keybindings via editor via the settings menu or `⌘,`/`⌘K ⌘S` respectively. This will change the settings.json/keybindings.json in `$HOME/Library/Application\ Support/Code/User`.
2. Run `make save`. This will pull any changes from the `$HOME/Library/Application\ Support/Code/User` directory to this repo.

### Other Computers
2. Run `make install`. This will install all updated config and extenstions.

## Setup
To setup this configuration on a new machine go through the following steps.

1. Clone this repo.
2. Ensure `code` accessible in `$PATH`.
3. Run `make install`. This will install all the extentions in `extension.txt` and link the configuration in settings.json/keybindings.json to `$HOME/Library/Application\ Support/Code/User`. Requires `npm` and `vsce` to be installed.
4. Drag panel containers - terminal, output, debug console, problems - from panel to secondary bar.

## Make Help
```txt
$ make help

General
  help             Display this help text

Lifecycle
  install          Build custom extension, install all extensions, write config files
  save             Update repo extension list, write config files from user directory to repo
```
