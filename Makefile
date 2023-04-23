##@ General
help:  ## Display this help text
	@grep -hE '(^[a-zA-Z_%\-]+:.*?## .*$$|^##@.*)' $(MAKEFILE_LIST) | sed s/-default// | awk 'BEGIN {FS = ":.*##";} /^[a-zA-Z_+0-9-]+:.*?##/ { printf "  \033[33m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } END{print ""}'

##@ Lifecycle
install: ext-custom ext-install-all link-from-repo  ## Build custom extension, install all extensions, write config files

save: ext-list-all link-from-user  ## Update repo extension list, write config files from user directory to repo

link-from-user:
	@printf "Linking configuration files..."
	@ln -f $$HOME/Library/Application\ Support/Code/User/keybindings.json keybindings.json
	@ln -f $$HOME/Library/Application\ Support/Code/User/settings.json settings.json
	@echo "done"

link-from-repo:
	@printf "Linking configuration files..."
	@ln -f keybindings.json $$HOME/Library/Application\ Support/Code/User/keybindings.json
	@ln -f settings.json $$HOME/Library/Application\ Support/Code/User/settings.json
	@echo "done"

## Extensions
ext-custom:  # Build and install custom extension
	@printf "Building custom extension..."
	@$(MAKE) -C cmg build
	@echo "done"

ext-list-all:  # Write external extensions list to extensions.txt
	@printf "Building extension list..."
	@bash extension_list.sh | sort | uniq > extensions.txt
	@echo "done"

ext-install-all:  # Install external extensions in extensions.txt
	@cat extensions.txt | while read ex; do code --install-extension $${ex}; done
