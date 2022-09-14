.PHONY: node
ALL_TARGETS += node

NODE_INSTALLED_PACKAGES = $(notdir $(shell npm list -g --depth=0 --parseable | tail -n +2))
NODE_PACKAGES_TO_INSTALL = $(filter-out $(NODE_INSTALLED_PACKAGES),$(NODE_PACKAGES))

node:
	npm update -g
	@for package in $(NODE_PACKAGES_TO_INSTALL) ; do \
		npm install -g $$package ; \
	done
