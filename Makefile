extension:
	@echo "Building custom extension"
	@$(MAKE) -C cmg build

setup: extension
	@echo "Linking configuration files"
	@ln keybindings.json $$HOME/Library/Application Support/Code/User/keybindings.json
	@ln settings.json $$HOME/Library/Application Support/Code/User/settings.json

extension-list:
	@bash extension_list.sh | sort | uniq -u >> extensions.txt

install-extensions:
	@cat extensions.txt | while read ex; do code --install-extensions $${ex}; done
