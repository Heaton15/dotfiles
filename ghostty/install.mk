.PHONY: ghostty ghostty-ext-keyboard ghostty-mac-keyboard
ALL_TARGETS += ghostty

ghostty-setup:
	./install_dir.sh  ghostty/themes ~/.config/ghostty/themes
	./install_dir.sh  ghostty/global ~/.config/ghostty/global

ghostty: ghostty-setup
	./install_file.sh ghostty/config-mac-keyboard ~/.config/ghostty/config

ghostty-ext-keyboard: ghostty-setup
	./install_file.sh ghostty/config-ext-keyboard  ~/.config/ghostty/config


