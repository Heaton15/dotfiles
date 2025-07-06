.PHONY: scala
ALL_TARGETS += scala

OS_TYPE := $(shell uname -a | cut -d' ' -f1)

ifeq ($(SDKMAN_DIR),)
$(error Please install sdkman: >>> \
	curl -s "https://get.sdkman.io?rcupdate=false" | bash \
	<<<)
endif

DARWIN_ARM_CS := https://github.com/coursier/launchers/blob/master/cs-aarch64-apple-darwin.gz
DARWIN_x86_64_CS := https://github.com/coursier/launchers/blob/master/cs-x86_64-apple-darwin.gz 
LINUX_x86_64_CS := https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux

ifeq ($(shell which cs 2> /dev/null),)
	ifeq ($(OS_TYPE), Darwin)
		ifeq ($(HOSTTYPE), aarch64)
        $(error Please install coursier: >>> \
            curl -fL ${DARWIN_ARM_CS} | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs \
		 <<<)
		endif
		ifeq ($(HOSTTYPE), x86_64)
        $(error Please install coursier: >>> \
            curl -fL ${DARWIN_x86_64_CS} | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs \
		 <<<)
		endif
	endif

	ifeq ($(OS_TYPE), Linux)
		ifeq ($(HOSTTYPE), x86_64)
        $(error Please install coursier: >>> \
            curl -fL ${LINUX_x86_64_CS} > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs \
		 <<<)
		endif
	endif
endif

scala:
	cs update --quiet
	./install_file.sh scala/scalafix.conf ~/.scalafix.conf
	./install_file.sh scala/scalafmt.conf ~/.scalafmt.conf
