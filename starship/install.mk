.PHONY: starship
ALL_TARGETS += starship

starship:
	./install_file.sh starship/starship.toml ~/.config/starship.toml
