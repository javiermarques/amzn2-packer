#!/usr/bin/env bash

#yum install gcc make perl kernel-headers
# yum update -y

# yum install -y gcc dkms make bzip2 perl
# yum install -y kernel-headers-`uname -r`
yum install -y gcc kernel-devel-`uname -r` kernel-headers-`uname -r` dkms make bzip2 perl

KERN_DIR=/usr/src/kernels/`uname -r`/build
export KERN_DIR

mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
