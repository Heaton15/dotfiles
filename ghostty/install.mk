.PHONY: ghostty
ALL_TARGETS += ghostty

ghostty:
	./install_file.sh ghostty/config ~/.config/ghostty/config
	./install_dir.sh ghostty/themes ~/.config/ghostty/themes
