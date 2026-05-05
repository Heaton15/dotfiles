.PHONY: fish
ALL_TARGETS += fish

# We can't install fisher deps from the CLI in a Makefile since
# its not a bin and is instead a shell file.
# Put the deps here so we can reference them later
FISHER_DEPS := jorgebucaran/hydro \
			   edc/bass
fish:
	./install_file.sh fish/config.fish ~/.config/fish/config.fish
