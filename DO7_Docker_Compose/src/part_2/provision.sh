apt-get update

apt-get install openssh-server -y
systemctl enable ssh
systemctl start ssh