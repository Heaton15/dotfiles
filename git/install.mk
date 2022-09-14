.PHONY: git
ALL_TARGETS += git

git:
	./install_file.sh git/gitconfig        ~/.gitconfig
	./install_file.sh git/gitignore_global ~/.gitignore_global
