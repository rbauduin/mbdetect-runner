#!/bin/bash
echo "Will now run mbdetect client"
vagrant ssh -c "/vagrant/guest_scripts/run_tests.sh"

echo "copying logs"
./rsync.sh -a default:logs ./

echo "You can find your run logs under the logs/ directory:"
ls -t logs/ | head -n 1
