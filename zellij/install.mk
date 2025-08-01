.PHONY: zellij-cfg
ALL_TARGETS += zellij-cfg

zellij-cfg:
	./install_file.sh zellij/config.kdl          ~/.config/zellij/config.kdl
	./install_file.sh zellij/nightfox-themes.kdl ~/.config/zellij/themes/nightfox-themes.kdl
	./install_file.sh zellij/default.kdl         ~/.config/zellij/layouts/default.kdl
	./install_file.sh zellij/claude.kdl          ~/.config/zellij/layouts/claude.kdl

