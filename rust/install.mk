.PHONY: rust
ALL_TARGETS += rust

.PHONY: rust

$(RUST_PACKAGES):
	cargo install --root "$$HOME/.local/" --locked $@

rust: $(RUST_PACKAGES)

