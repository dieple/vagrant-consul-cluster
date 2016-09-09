#!/bin/bash

# Step 1 - Get the necessary utilities and install them.
apt-get update
apt-get install -y unzip
groupadd consul
useradd -m -g consul -s /bin/bash consul

# Step 2 - Copy the upstart script to the /etc/init folder.
cp /vagrant/consul-server.conf /etc/init/consul.conf

# Step 3 - Get the Consul Zip file and extract it.
cd /usr/local/bin
wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip
unzip *.zip
rm *.zip

# Step 4 - Make the Consul directory.
mkdir -p /etc/consul.d
mkdir /var/consul
chown -R consul:consul /var/consul

# Step 5 - Copy the server configuration.
cp $1 /etc/consul.d/config.json

# Step 6 - Configure /etc/hosts file
echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "172.20.20.10    consul1.example.com  consul1" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "172.20.20.20    consul2.example.com  consul2" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "172.20.20.30    consul3.example.com  consul3" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "172.20.20.40   consulclient1.example.com  consulclient1" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "172.20.20.50   consulclient2.example.com  consulclient2" | sudo tee --append /etc/hosts 2> /dev/null

# Step 7 - Start Consul
start consul
