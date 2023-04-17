#/bin/bash

sudo yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc
sudo -i PWD=/root  wget https://nginx.org/packages/centos/7/SRPMS/nginx-1.14.1-1.el7_4.ngx.src.rpm
sudo -i PWD=/root  rpm -i nginx-1.14.1-1.el7_4.ngx.src.rpm
sudo -i PWD=/root  wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz --no-check-certificate
sudo -i PWD=/root  tar -xvf openssl-1.1.1a.tar.gz 
sudo -i PWD=/root  yum-builddep /root/rpmbuild/SPECS/nginx.spec -y
sudo wget https://gist.githubusercontent.com/lalbrekht/6c4a989758fccf903729fc55531d3a50/raw/8104e513dd9403a4d7b5f1393996b728f8733dd4/gistfile1.txt -O /root/rpmbuild/SPECS/nginx.spec
sudo -i PWD=/root rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec 
sudo -i PWD=/root  yum localinstall -y rpmbuild/RPMS/x86_64/nginx-1.14.1-1.el7_4.ngx.x86_64.rpm 
sudo systemctl start nginx
sudo mkdir /usr/share/nginx/html/repo
sudo cp /root/rpmbuild/RPMS/x86_64/nginx-1.14.1-1.el7_4.ngx.x86_64.rpm /usr/share/nginx/html/repo/
sudo wget https://repo.percona.com/yum/percona-release-latest.noarch.rpm -O /usr/share/nginx/html/repo/percona-release-latest.noarch.rpm
sudo createrepo /usr/share/nginx/html/repo/
sudo nginx -s reload
sudo sh -c 'cat >> /etc/yum.repos.d/otus.repo << EOF
[otus]
name=otus-linux
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF'
sudo yum install percona-release -y
