.PHONY: ghostty ghostty-ext-keyboard ghostty-mac-keyboard
ALL_TARGETS += ghostty

ghostty-themes:
	./install_dir.sh  ghostty/themes ~/.config/ghostty/themes

ghostty: ghostty-themes
	./install_file.sh ghostty/config ~/.config/ghostty/config

ghostty-ext-keyboard: ghostty-themes
	./install_file.sh ghostty/config-ext-keyboard  ~/.config/ghostty/config


