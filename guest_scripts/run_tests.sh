#!/bin/bash

# script running mbdetect inside the vm

set -x 

trace=$(tempfile)
# start tcpdump in tmux session
tmux new -d -s tcpdump "/usr/sbin/tcpdump -i any port 80 -s 120 -w $trace"

# run tests
sudo ./client

# stop tcpdump
tmux kill-session -t tcpdump
gzip $trace

# determine run_id by looking at last directory created in logs/
run_id=$(ls -t  ~/logs | head -n 1)

# upload tcpdump trace to server
lftp ftp://multipath-tcp.org -e "put -O /mbdetect/$run_id/client ${trace}.gz -o client_trace.pcap.gz ; quit"

# move trace to lcient logs dir, so it will be synced to the host too
sudo mv ${trace}.gz ~/logs/$run_id/client_trace.pcap.gz

