.PHONY: fish
ALL_TARGETS += fish

fish:
	./install_file.sh fish/config.fish ~/.config/fish/config.fish
