DEST    ?= $$HOME
BIN_DIR := /usr/local/bin

REAL_DIRS := \
	.config/env\
	.config/fish/completions \
	.config/fish/conf.d \
	.config/fish/functions \
	.gnupg \
	.ssh \
	.vim/backups \
	.vim/bundle

$(addprefix $(DESTDIR)/,$(REAL_DIRS)):
	mkdir -p $@

.PHONY: install
install: | $(REAL_DIRS)
	stow -t $(DEST) fish-stow
	stow -t $(DEST) tmux-stow
	stow -t $(DEST) git-stow
	stow -t $(DEST) vim-stow
	stow -t $(DEST) gnupg

.PHONY: install-bin
install-bin:
	stow -t /usr/local/bin bin
