ifeq ($(wildcard cfg.mk),)
$(error Missing dotfiles config file 'cfg.mk', check examples in 'config/' folder)
endif

include cfg.mk

ALL_TARGETS =

.PHONY: all default
default: all

ifeq ($(BREW),1)
include brew/install.mk
endif

ifeq ($(GIT),1)
include git/install.mk
endif

ifeq ($(NODE),1)
include node/install.mk
endif

ifeq ($(NVIM),1)
include nvim/install.mk
endif

ifeq ($(PYTHON),1)
include python/install.mk
endif

ifeq ($(SCALA),1)
include scala/install.mk
endif

ifeq ($(TMUX),1)
include tmux/install.mk
endif

ifeq ($(BASH), 1)
include bash/install.mk
endif

ifeq ($(GHOSTTY), 1)
include ghostty/install.mk
endif

ifeq ($(RUST), 1)
include rust/install.mk
endif

all: $(ALL_TARGETS)
