BREW     := 0
GIT      := 1
NODE     := 0
NVIM     := 1
BASH     := 1
PYTHON   := 0
SCALA    := 1
TERMINAL := 0
TMUX     := 1
GHOSTTY  := 1
RUST     := 1
ZELLIJ   := 1
VERIBLE  := 1

BREW_FORMULAE := \
	bat \
	duf \
	dust \
	exa \
	fd \
	fzf \
	git \
	git-delta \
	hadolint \
	hyperfine \
	jq \
	node \
	neovim \
	python \
	ripgrep \
	shellcheck \
	shfmt \
	stylua \
	tmux \
	tokei \
	zsh

NODE_PACKAGES := \
	npm \
	neovim \
	pyright

PYTHON_PACKAGES := \
	black \
	matplotlib \
	numpy \
	pynvim \
	scipy

RUST_PACKAGES := \
	watchexec-cli \
	zellij \
	ripgrep \
	fd-find

