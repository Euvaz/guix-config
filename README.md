# Dotfiles

A minimal repository dedicated to hosting my Linux dotfiles.

Utilizing a minimal [Python](https://www.python.org/) script in order to perform configuration tasks.

## How it works

This repository hosts valuable configuration files that I would like to be identical across my machines. Configuration files are stored within this repo, and symbolic links are created to their respective directories in `$HOME` and `$HOME/.config`.

## Execution

```
$ python gen-symlinks.py
```
