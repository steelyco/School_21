apt update

apt install openssh-server -y
systemctl enable ssh
systemctl start ssh

apt install docker.io -y

sleep 30

SWARM_TOKEN=$(cat /home/vagrant/code/swarm-token-worker)
docker swarm join --token $SWARM_TOKEN manager1:2377