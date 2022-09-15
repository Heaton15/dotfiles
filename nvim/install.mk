.PHONY: nvim
ALL_TARGETS += nvim

nvim:
	./install_file.sh nvim/init.lua   	     ~/.config/nvim/init.lua
	./install_dir.sh  nvim/lua        	     ~/.config/nvim/lua
	./install_dir.sh  nvim/lua/config        ~/.config/nvim/lua/config
	./install_dir.sh  nvim/after/syntax      ~/.config/nvim/after/syntax
