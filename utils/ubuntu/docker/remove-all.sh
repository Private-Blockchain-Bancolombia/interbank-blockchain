# Remove all containers
clear

sudo docker rm $(sudo docker ps -a -q)