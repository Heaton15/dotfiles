BREW     := 0
GIT      := 1
NODE     := 0
NVIM     := 1
BASH     := 1
PYTHON   := 1
SCALA    := 1
TERMINAL := 0
TMUX     := 1
GHOSTTY  := 1

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
	schemdraw \
	matplotlib \
	numpy \
	pynvim \
	scipy
