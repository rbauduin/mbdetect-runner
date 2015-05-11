#!/bin/bash
set -x

# copy all guest scripts
cp /vagrant/guest_scripts/* /usr/local/bin/

# set default route via the bridge, not the nat
host_ipv4="192.168.33.1"

# set default route with prefered source address
ip route del default via 10.0.2.2
ip route add default via $host_ipv4 src 192.168.33.10

# NAT of packets sent with source 10.0.0.0/8
iptables -t nat -A POSTROUTING -o eth1 -s 10.0.0.0/8 -j MASQUERADE
