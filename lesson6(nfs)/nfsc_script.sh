#/bin/bash

sudo -i
yum install -y nfs-utils
systemctl enable firewalld --now
systemctl status firewalld
echo "192.168.50.10:/srv/share/ /mnt nfs vers=3,proto=udp,auto 0 0" >> /etc/fstab
systemctl daemon-reload
systemctl restart remote-fs.target
cd /mnt/
cd /mnt/upload/
touch client_file

