.PHONY: nvim
ALL_TARGETS += nvim

nvim:
	./install_file.sh nvim/init.lua   	     ~/.config/nvim/init.lua
	./install_dir.sh  nvim/lua/config        ~/.config/nvim/lua/config
	./install_dir.sh  nvim/lua/plugins       ~/.config/nvim/lua/plugins
	./install_dir.sh  nvim/after/syntax      ~/.config/nvim/after/syntax
	./install_dir.sh  nvim/lsp/              ~/.config/nvim/lsp
