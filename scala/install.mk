.PHONY: scala
ALL_TARGETS += scala

OS_TYPE := $(shell uname)
HOST_TYPE := $(shell uname -m)
DARWIN_ARM_CS := https://github.com/coursier/launchers/blob/master/cs-aarch64-apple-darwin.gz
DARWIN_x86_64_CS := https://github.com/coursier/launchers/blob/master/cs-x86_64-apple-darwin.gz 
LINUX_x86_64_CS  := https://github.com/coursier/launchers/blob/master/cs-x86_64-pc-linux.gz
JAR_LAUNCHER_CS := https://github.com/coursier/launchers/raw/master/coursier

scala:
	@if [ ! -d "${HOME}/.sdkman" ]; then \
		echo "Please install sdkman: >>> curl -s https://get.sdkman.io?rcupdate=false | bash  <<<"; \
		exit 1; \
	fi

	@if ! command -v cs > /dev/null 2>&1; then \
		if [ "$(OS_TYPE)" = "Darwin" ] && [ "$(HOST_TYPE)" = "arm64" ]; then \
			echo "Please install coursier: >>> curl -fL ${DARWIN_ARM_CS} | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs <<<"; \
			exit 1; \
		elif [ "$(OS_TYPE)" = "Darwin" ] && [ "$(HOST_TYPE)" = "x86_64" ]; then \
			echo "Please install coursier: >>> curl -fL ${DARWIN_x86_64_CS} | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs <<<"; \
			exit 1; \
		elif [ "$(OS_TYPE)" = "Linux" ] && [ "$(HOST_TYPE)" = "x86_64" ]; then \
			echo "Please install coursier: >>> curl -fL ${LINUX_x86_64_CS} > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs <<<"; \
			exit 1; \
		else \
		echo "OS_TYPE: $(OS_TYPE) - HOST_TYPE: $(HOST_TYPE) coursier install not found."; \
			exit 1; \
		fi; \
	fi

	cs update --quiet
	./install_file.sh scala/scalafix.conf ~/.scalafix.conf
	./install_file.sh scala/scalafmt.conf ~/.scalafmt.conf
