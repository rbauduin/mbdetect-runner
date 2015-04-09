#!/bin/sh
vagrant ssh-config > ssh-config
 
scp -F ssh-config "$@" || echo "Transfer failed. Did you use 'default' as remote hostname?" 
