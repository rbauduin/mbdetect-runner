About
=====
This repo contains vagrant configurations to run mbdetect, a middlebox detection tool used
to identify situation causing trouble to MPTCP.

The setup enables you to help test MPTCP from the virtual machine without requiring MPTCP 
support from the host.

Requirements
============
You need a recent vagrant installed and virtualbox. Get it at http://www.vagrantup.com/downloads.html
and https://www.virtualbox.org/wiki/Downloads

On Linux, you might also need to load the required kernel modules to use virtualbox and the host network adaptor:
```
vboxdrv vboxnetadp vboxnetflt
```

When vagrant is installed, you need to install the vagrant-trigger plugin:
  vagrant plugin install vagrant-triggers

You also need to have root access via sudo so the script can add NAT rules.
Currently only Linux hosts with iptables are supported, but other unix-like host should
be able to run this. Patches welcome!

Using it
========

Get it and use it:

    git clone https://github.com/rbauduin/mbdetect_runner.git
    cd mbdetect_runner
    vagrant up

This will:

  * download a vagrant box
  * start the virtual machine
  * setup NAT
  * run the mbdetect tests suite
  * upload your client's logs to the multipath-tcp.org server for analysis
  * copy the client logs/ to your current directory

To validate your vm access the internet with mptcp enabled, issue this command:

    vagrant ssh -c "curl www.multipath-tcp.org"

The outpout should be message full of joy, congratulating you for your MPTCP capabilities!

You stop the vm by issuing
  vagrant halt
This will also remove the NAT that was setup when starting the vm.
  
