.PHONY: rust
ALL_TARGETS += rust

.PHONY: rust

FORCE ?=

$(RUST_PACKAGES):
	cargo install --root "$$HOME/.local/" --locked $@ $(if $(FORCE),--force)

rust: $(RUST_PACKAGES)

