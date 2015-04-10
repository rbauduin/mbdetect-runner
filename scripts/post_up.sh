#!/bin/bash
# Setting up NAT

echo "Will setup masquerading. Sudo might ask your password..."
sudo iptables -t nat -I POSTROUTING -s 192.168.33.0/24 -j MASQUERADE
sudo iptables -I FORWARD -i vboxnet0 -j ACCEPT
sudo iptables -I FORWARD -o vboxnet0 -j ACCEPT
sudo iptables -I INPUT -i vboxnet0 -j ACCEPT

cat /proc/sys/net/ipv4/ip_forward > .ip_forward
sudo sysctl net.ipv4.ip_forward=1

for f in user_scripts/up/* ; do
	if [[ -x $f ]] ; then
		echo $(basename $f)
		$f
	else
		echo "Not executable! Skipping $f"
	fi
done
