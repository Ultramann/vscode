##@ General
help:  ## Display this help text
	@grep -hE '(^[a-zA-Z_%\-]+:.*?## .*$$|^##@.*)' $(MAKEFILE_LIST) | sed s/-default// | awk 'BEGIN {FS = ":.*##";} /^[a-zA-Z_+0-9-]+:.*?##/ { printf "  \033[33m%-19s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } END{print ""}'

##@ Lifecycle
link:
	@echo "Linking configuration files"
	@ln -f keybindings.json $$HOME/Library/Application\ Support/Code/User/keybindings.json
	@ln -f settings.json $$HOME/Library/Application\ Support/Code/User/settings.json

setup: extension-custom extensions-install link  ## Build custom extension, install all extensions, link config files

update: extensions-list  ## Update extension list, alias for extensions-list

##@ Extensions
extension-custom:  ## Build and install custom extension
	@echo "Building custom extension"
	@$(MAKE) -C cmg build

extensions-list:  ## Write external extensions list to extensions.txt
	@bash extension_list.sh | sort | uniq > extensions.txt

extensions-install:  ## Install external extensions in extensions.txt
	@cat extensions.txt | while read ex; do code --install-extensions $${ex}; done
