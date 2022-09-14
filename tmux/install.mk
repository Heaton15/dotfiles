.PHONY: tmux
ALL_TARGETS += tmux

tmux:
	./install_file.sh tmux/tmux.conf                  ~/.tmux.conf
	./install_file.sh tmux/tmux_carbonfox.tmux ~/.tmux/tmux_carbonfox.tmux
