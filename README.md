# Dotfiles

A minimal repository dedicated to hosting my Linux dotfiles.

Utilizing [Ansible](https://www.ansible.com/) and a [Bash](https://www.gnu.org/software/bash/) script in order to handle dependencies and perform configuration tasks.

## How it works

This repository hosts valuable configuration files that I would like to be identical across my machines. Configuration files are stored within this repo, and symbolic links are created to their respective directories in `$HOME` and `$HOME/.config`.

## Execution

```
$ ansible-playbook --inventory ansible/inventories/hosts.yaml ansible/playbooks/sync-dotfiles.yaml --ask-become-pass
```
