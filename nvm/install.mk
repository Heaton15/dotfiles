.PHONY: nvm
ALL_TARGETS += nvm
NVM_VERSION=0.40.8
nvm:
	# Install nvm to manage node on servers with outdated node versions
	@if [ ! -s "$$HOME/.nvm/nvm.sh" ] || [ "$$(. "$$HOME/.nvm/nvm.sh" && nvm --version)" != "$(NVM_VERSION)" ]; then \
		curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v$(NVM_VERSION)/install.sh" | PROFILE=/dev/null bash; \
	fi
	nvm install --lts
