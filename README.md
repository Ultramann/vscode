# VSCode Configuration

## Change Flow
To make changes to your vscode configuration go through the following steps.

1. Make changes to settings/keybindings via editor via the settings menu or `⌘,`/`⌘K ⌘S` respectively. This will change the settings.json/keybindings.json in `$HOME/Library/Application\ Support/Code/User`.
2. Run `make save`. This will pull any changes from the `$HOME/Library/Application\ Support/Code/User` directory to this repo.

### Other Computers
3. Run `make install`. This will install all updated config and extenstions.

## Setup
To setup this configuration on a new machine go through the following steps.

1. Clone this repo
1. Ensure `code` accessible in `$PATH`
   ```
   export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"
   ```
1. Install `npm` and `vsce` for custom extension
   ```
   brew install node`
   npm install --global @vscode/vsce
   ```
1. Run `make install`. This will install the custom extension, all the extentions in `extension.txt`, and link the configuration in `settings.json`/`keybindings.json` to `$HOME/Library/Application\ Support/Code/User`
1. Drag panel containers - terminal, output, debug console, problems - from panel to secondary bar.

## Make Help
```txt
$ make help

General
  help             Display this help text

Lifecycle
  install          Build custom extension, install all extensions, write config files
  save             Update repo extension list, write config files from user directory to repo
```
