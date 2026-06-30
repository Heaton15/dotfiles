.PHONY: scala
ALL_TARGETS += scala

OS_TYPE := $(shell uname)
DARWIN_ARM_CS := https://github.com/coursier/launchers/blob/master/cs-aarch64-apple-darwin.gz
DARWIN_x86_64_CS := https://github.com/coursier/launchers/blob/master/cs-x86_64-apple-darwin.gz 
LINUX_x86_64_CS  := https://github.com/coursier/launchers/blob/master/cs-x86_64-pc-linux.gz
JAR_LAUNCHER_CS := https://github.com/coursier/launchers/raw/master/coursier

scala:
	# Need to have sdk to manage JVM for scala
	@if command -v sdk > /dev/null 2>&1; then \
		echo "Please install sdkman: >>> curl -s https://get.sdkman.io?rcupdate=false | bash  <<<"; \
		exit 1; \
	fi

	# If we don't have coursier, give the install user a install version
	@if command -v cs > /dev/null 2>&1; then \
		if [ "$(OS_TYPE)" = "Darwin" ] && [ "$(HOSTTYPE)" = "aarch64" ]; then \
			echo "Please install coursier: >>> curl -fL ${DARWIN_ARM_CS} | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs <<<"; \
			exit 1; \
		elif [ "$(OS_TYPE)" = "Darwin" ] && [ "$(HOSTTYPE)" = "x86_64" ]; then \
			echo "Please install coursier: >>> curl -fL ${DARWIN_x86_64_CS} | gunzip -c > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs <<<"; \
			exit 1; \
		elif [ "$(OS_TYPE)" = "Linux" ] && [ "$(HOSTTYPE)" = "x86_64" ]; then \
			echo "Please install coursier: >>> curl -fL ${LINUX_x86_64_CS} > ~/.local/bin/cs && chmod 755 ~/.local/bin/cs <<<"; \
			exit 1; \
		else \
			echo "Host Machine is neither Mac or Linux..."; \
			exit 1; \
		fi; \
	fi

	cs update --quiet
	./install_file.sh scala/scalafix.conf ~/.scalafix.conf
	./install_file.sh scala/scalafmt.conf ~/.scalafmt.conf
