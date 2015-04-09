#!/bin/bash

echo "Will now run mbdetect client"
vagrant ssh -c "sudo /usr/local/bin/client"

echo "copying logs"
./rsync.sh -a default:logs ./

echo "You can find your run logs under the logs/ directory:"
ls logs/
