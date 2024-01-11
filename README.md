# Dotfiles

A minimal repository dedicated to hosting my Linux dotfiles.

Utilizing [Chezmoi](https://github.com/twpayne/chezmoi) in order to synchronize my dotfiles.

## How it works

This repository hosts valuable configuration files that I would like to be identical across my machines. Configuration files are stored within this repo, and Chezmoi handles enforcing dotfile state.

## Execution

```
$ chezmoi init --apply https://github.com/Euvaz/dotfiles.git
```
