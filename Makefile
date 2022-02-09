all:
	stow --dotfiles -t $(HOME) bash
	stow --dotfiles -t $(HOME) emacs
	stow --dotfiles -t $(HOME) git
	stow --dotfiles -t $(HOME)/.config liquidprompt
	# Bug in stow v2.3.1 which prevents making the neovim target the ~/.config directory:
	stow --dotfiles -t $(HOME)/.config nvim
	stow --dotfiles -t $(HOME) tmux
	stow --dotfiles -t $(HOME) x
