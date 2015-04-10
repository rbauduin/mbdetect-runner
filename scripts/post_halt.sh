#!/bin/bash
# Removing NAT

echo "Will remove masquerading. Sudo might ask your password..."
sudo iptables -t nat -D POSTROUTING -s 192.168.33.0/24 -j MASQUERADE
sudo iptables -D FORWARD -i vboxnet0 -j ACCEPT
sudo iptables -D FORWARD -o vboxnet0 -j ACCEPT
sudo iptables -D INPUT -i vboxnet0 -j ACCEPT

for f in user_scripts/halt/* ; do 
	if [[ -x $f ]] ; then
		$f
	else
		echo "Not executable! Skipping $f"
	fi
done
