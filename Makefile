##@ General
help:  ## Display this help text
	@grep -hE '(^[a-zA-Z_%\-]+:.*?## .*$$|^##@.*)' $(MAKEFILE_LIST) | sed s/-default// | awk 'BEGIN {FS = ":.*##";} /^[a-zA-Z_+0-9-]+:.*?##/ { printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } END{print ""}'

##@ Setup
setup: extension install-extensions  ## Build and install custom extension link config files
	@echo "Linking configuration files"
	@ln keybindings.json $$HOME/Library/Application Support/Code/User/keybindings.json
	@ln settings.json $$HOME/Library/Application Support/Code/User/settings.json

##@ Extensions
extension:  ## Build and install custom extension
	@echo "Building custom extension"
	@$(MAKE) -C cmg build

extension-list:  ## Write extension list to extensions.txt
	@bash extension_list.sh | sort | uniq -u >> extensions.txt

install-extensions:  ## Install extensions in extensions.txt
	@cat extensions.txt | while read ex; do code --install-extensions $${ex}; done
