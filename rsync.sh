#!/bin/sh
vagrant ssh-config > ssh-config

rsync -e "ssh -F ssh-config" "$@" || "Transfer failed. Did you use 'default' as remote hostname?"
