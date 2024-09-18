.PHONY: scala
ALL_TARGETS += scala

ARCH_TYPE := $(shell uname -a | awk '{print $$NF}')

ifeq ($(SDKMAN_DIR),)
$(error Please install sdkman: >>> \
	curl -s "https://get.sdkman.io?rcupdate=false" | bash \
	<<<)
endif

ifeq ($(shell which cs 2> /dev/null),)
    ifeq ($(ARCH_TYPE), arm64)
        $(error Please install coursier: >>> \
            curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-apple-darwin.gz | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs \
		 <<<)
    else ifeq ($(ARCH_TYPE), x86_64)
        $(error Please install coursier: >>> \
			curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-apple-darwin.gz | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs \
		 <<<)
    endif
endif

# TODO: Install zsh completions for coursier?
# TODO: Install scalafix/scalafmt?

scala:
	cs update --quiet
	./install_file.sh scala/scalafix.conf ~/.scalafix.conf
	./install_file.sh scala/scalafmt.conf ~/.scalafmt.conf
