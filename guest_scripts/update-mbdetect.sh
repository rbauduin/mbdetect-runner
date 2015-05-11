#!/bin/bash


for f in client libcurl_tests.so libdns_tests.so; do 
  curl http://www.multipath-tcp.org/mbdetect/$f > /home/vagrant/$f
done
chmod +x /home/vagrant/client
