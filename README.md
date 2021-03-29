Dotfiles
========

This project contains important shell dotfiles, environment config,
aliases, git config, etc, that I want to keep across machines. It uses 
[GNU Stow](https://www.gnu.org/software/stow/) to manage these files.

## Prerequisites

* GNU Stow

## Installing

```
$ stow -t $HOME git
$ stow -t $HOME nvim
$ stow -t $HOME tmux
$ stow -t $HOME zsh
```
