#!/usr/bin/bash
ansible-playbook --inventory ansible/inventories/hosts.yaml ansible/playbooks/sync-dotfiles.yaml --ask-become-pass

