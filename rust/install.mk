.PHONY: rust
ALL_TARGETS += rust

FORCE ?=

cargo_install:
	@if ! command -v cargo > /dev/null 2>&1; then \
		echo "Please install cargo: >>> curl https://sh.rustup.rs -sSf | sh <<<"; \
		exit 1; \
	fi

$(ALL_RUST_PACKAGES): cargo_install
	cargo install --root "$$HOME/.local/" --locked $@ $(if $(FORCE),--force)

rust: $(ALL_RUST_PACKAGES)
