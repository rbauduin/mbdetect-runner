#!/bin/bash
set -x 
if [[ ! -x $(which vagrant) ]] ; then
	echo >2 "Vagrant executabl not found" 
	exit ;
fi

echo "Installing vagrant-triggers plugin if needed"
vagrant plugin list | grep "vagrant-triggers" || vagrant plugin install vagrant triggers

echo "All set up, starting vm..."
vagrant up

echo "Will now run mbdetect client"
vagrant ssh -c "/vagrant/scripts/run_tests.sh"

echo "copying logs"
./rsync.sh -a default:logs ./

echo "You can find your run logs under the logs/ directory:"
ls -t logs/ | head -n 1
