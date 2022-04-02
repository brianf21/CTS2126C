# System Setup
yum -y update
yum -y install git
hostnamectl set-hostname rocky.example.com
echo -e 127.0.0.1\t\trocky.example.com rocky >> /etc/hosts
echo -e ::1\t\t\trocky.example.com rocky >> /etc/hosts
nmcli con add con-name ens8-static ifname ens8 type ethernet ip4 10.0.0.50/24 gw4 10.0.0.1 ipv4.dns 8.8.8.8,8.8.4.4 autoconnect yes ipv4.method manual
nmcli con del ens8
firewall-cmd --add-service http --permanent --zone public
firewall-cmd --add-port 8080/tcp --permanent --zone public
firewall-cmd --add-port 9090/tcp --permanent --zone public

# Installing Docker
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install docker-ce --nobest -y --allowerasing
systemctl start docker
systemctl enable docker
curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Installing hackazon
git clone https://github.com/Newlode/hackazon/
reboot

# cd hackazon/
# docker-compose up &

# Installing WebGoat
docker pull webgoat/goatandwolf

# docker run -it -p 10.0.0.50:80:8888 -p 10.0.0.50:8080:8080 -p 10.0.0.50:9090:9090 -e TZ=America/New_York webgoat/goatandwolf
