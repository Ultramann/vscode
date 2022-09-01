extension:
	@echo "Building custom extension"
	@$(MAKE) -C cmg build

setup: extension
	@echo "Linking configuration files"
	@ln keybindings.json $$HOME/Library/Application Support/Code/User/keybindings.json
	@ln settings.json $$HOME/Library/Application Support/Code/User/settings.json
