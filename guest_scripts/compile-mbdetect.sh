#!/bin/bash
sudo apt-get -y install build-essential libconfig-dev uuid-dev libc-ares-dev libcurl4-openssl-dev git
cd /usr/local/mbdetect
sudo git pull
sudo make dns
sudo make curl
sudo make client
sudo cp libcurl_tests.so libdns_tests.so client /home/vagrant

