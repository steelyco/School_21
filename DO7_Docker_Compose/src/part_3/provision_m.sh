apt update

apt install openssh-server -y
systemctl enable ssh
sudo systemctl start ssh

apt install docker.io -y
apt install docker-compose -y

docker swarm init --advertise-addr enp0s8
docker swarm join-token -q worker > /home/vagrant/code/swarm-token-worker

cd ./code 
curl -L https://downloads.portainer.io/ce-lts/portainer-agent-stack.yml -o portainer-agent-stack.yml
# docker stack deploy -c portainer-agent-stack.yml portainer

# docker stack deploy -c docker-compose.yml app