#/bin/bash

#install zfs repo
yum install -y http://download.zfsonlinux.org/epel/zfs-release.el7_8.noarch.rpm
#import gpg key 
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
#install DKMS style packages for correct work ZFS
yum install -y epel-release kernel-devel zfs
#change ZFS repo
yum-config-manager --disable zfs
yum-config-manager --enable zfs-kmod
yum install -y zfs
#Add kernel module zfs
modprobe zfs
#install wget
yum install -y wget

zpool create otus01 mirror /dev/sdb /dev/sdc
zpool create otus02 mirror /dev/sdd /dev/sde
zpool create otus03 mirror /dev/sdf /dev/sdg
zpool create otus04 mirror /dev/sdh /dev/sdi

zfs set compression=lzjb otus01
zfs set compression=lz4 otus02
zfs set compression=gzip-9 otus03
zfs set compression=zle otus04
