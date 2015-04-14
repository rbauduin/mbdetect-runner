#!/bin/bash
sysctl net.ipv4.conf.all.forwarding > .forwarding
sudo sysctl net.ipv4.conf.all.forwarding=1

