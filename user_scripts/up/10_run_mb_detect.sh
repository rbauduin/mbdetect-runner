#!/bin/bash
# script launching the test from outside the vm
echo "Will now run mbdetect client"
vagrant ssh -c "/vagrant/scripts/run_tests.sh"

echo "copying logs"
./rsync.sh -a default:logs ./

echo "You can find your run logs under the logs/ directory:"
ls logs/
