#!/bin/bash


for f in client libcurl_tests.so libdns_tests.so; do 
  curl http://www.multipath-tcp.org/mbdetect/$f > /usr/local/bin/$f
done
chmod +x /usr/local/bin/client
