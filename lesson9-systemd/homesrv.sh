#/bin/bash

sudo -i
#  TASK1  #
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/main/lesson9-systemd/watchlog.log -O /var/log/watchlog.log
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/36f4ea90fc52ee47f1fdd8b23a5e8bd6218ab9f7/lesson9-systemd/watchlog -O /etc/sysconfig/watchlog
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/36f4ea90fc52ee47f1fdd8b23a5e8bd6218ab9f7/lesson9-systemd/watchlog.sh -O /opt/watchlog.sh
chmod +x /opt/watchlog.sh
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/36f4ea90fc52ee47f1fdd8b23a5e8bd6218ab9f7/lesson9-systemd/watchlog.service -O /etc/systemd/system/watchlog.service
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/36f4ea90fc52ee47f1fdd8b23a5e8bd6218ab9f7/lesson9-systemd/watchlog.timer -O /etc/systemd/system/watchlog.timer
systemctl start watchlog.timer
systemctl start watchlog.service

#  TASK2  #
yum install epel-release -y
yum install spawn-fcgi -y
yum install php -y
yum install php-cli -y
yum install mod_fcgid -y
yum install httpd -y
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/main/lesson9-systemd/spawn-fcgi -O /etc/sysconfig/spawn-fcgi
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/main/lesson9-systemd/spawn-fcgi.service -O /etc/systemd/system/spawn-fcgi.service
systemctl start spawn-fcgi

#  TASK3  #
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/main/lesson9-systemd/httpd.service -O /usr/lib/systemd/system/httpd.service
echo "OPTIONS=-f conf/first.conf" >/etc/sysconfig/httpd-first
echo "OPTIONS=-f conf/second.conf" >/etc/sysconfig/httpd-second
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/first.conf
wget https://raw.githubusercontent.com/Dmitry-Piven/otus-linux/main/lesson9-systemd/second.conf -O /etc/httpd/conf/second.conf
systemctl start httpd@first
systemctl start httpd@second
