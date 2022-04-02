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

# docker run -it -p 127.0.0.1:8888:8888 -p 127.0.0.1:8080:8080 -p 127.0.0.1:9090:9090 -e TZ=America/New_York webgoat/goatandwolf
# Open another tab and run the following command to stop goatandwolf
# docker container ls -a
# docker stop <put container name here from list>

# Installing DVWA
docker pull vulnerables/web-dvwa
# You only need to pull once

# If it has already been pulled then run this command to start the container
# docker run --rm -it -p 80:80 vulnerables/web-dvwa
