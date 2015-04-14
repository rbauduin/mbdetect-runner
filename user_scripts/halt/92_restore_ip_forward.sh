#!/bin/bash
if [[ -f .forwarding ]] ; then
  sudo sysctl --load .forwarding
  rm .forwarding
fi
