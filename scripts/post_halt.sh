#!/bin/bash
# Removing NAT

echo "Will remove masquerading. Sudo might ask your password..."
sudo iptables -t nat -D POSTROUTING -s 192.168.33.0/24 -j MASQUERADE
sudo iptables -D FORWARD -i vboxnet0 -j ACCEPT
sudo iptables -D FORWARD -o vboxnet0 -j ACCEPT
sudo iptables -D INPUT -i vboxnet0 -j ACCEPT

if [[ -e .ip_forward ]] ; then
    sudo sysctl net.ipv4.ip_forward=$(cat .ip_forward)
    rm .ip_forward
fi

for f in user_scripts/halt/* ; do
	if [[ -x $f ]] ; then
		$f
	else
		echo "Not executable! Skipping $f"
	fi
done
