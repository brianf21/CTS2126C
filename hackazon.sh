yum -y update
yum -y install git
hostnamectl set-hostname rocky.example.com
echo -e 127.0.0.1\t\trocky.example.com rocky >> /etc/hosts
echo -e ::1\t\t\trocky.example.com rocky >> /etc/hosts
nmcli con add con-name ens8-static ifname ens8 type ethernet ip4 10.0.0.50/24 gw4 10.0.0.1 ipv4.dns 8.8.8.8,8.8.4.4 autoconnect yes ipv4.method manual
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install docker-ce --nobest -y --allowerasing
systemctl start docker
systemctl enable docker
curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
git clone https://github.com/Newlode/hackazon/
# cd hackazon/
# docker-compose up
