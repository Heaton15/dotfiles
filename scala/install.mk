.PHONY: scala
ALL_TARGETS += scala

ifeq ($(SDKMAN_DIR),)
$(error Please install sdkman: >>> \
	curl -s "https://get.sdkman.io?rcupdate=false" | bash \
	<<<)
endif

ifeq ($(shell which cs 2> /dev/null),)
$(error Please install coursier: >>> \
	curl -fLo cs https://git.io/coursier-cli-"$$(uname | tr LD ld)" \
	<<<)
endif

# TODO: Install zsh completions for coursier?
# TODO: Install scalafix/scalafmt?

scala:
	cs update --quiet
	./install_file.sh scala/scalafix.conf ~/.scalafix.conf
	./install_file.sh scala/scalafmt.conf ~/.scalafmt.conf
