# VSCode Configuration

## Change Flow
To make changes to your vscode configuration go through the following steps.

1. Make changes to settings/keybindings via editor via the settings menu or `⌘,`/`⌘K ⌘S` respectively. This will change the settings.json/keybindings.json in `$HOME/Library/Application\ Support/Code/User`.
2. Run `make update`. This will pull any changes from the `$HOME/Library/Application\ Support/Code/User` directory to this repo.

## Setup
To setup this configuration on a new machine go through the following steps.

1. Clone this repo.
2. Run `make setup`. This will install all the extentions in `extension.txt` and link the configuration in settings.json/keybindings.json to `$HOME/Library/Application\ Support/Code/User`.

## Make Help
```txt
$ make help

General
  help             Display this help text

Lifecycle
  setup            Build custom extension, install all extensions, link config files
  update           Update extension list, link files from user directory

Extensions
  ext-custom       Build and install custom extension
  ext-list-all     Write external extensions list to extensions.txt
  ext-install-all  Install external extensions in extensions.txt
```
