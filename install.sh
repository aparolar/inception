#!/bin/bash

export HOSTS_OK=$(cat /etc/hosts | grep aparolar.42.fr | wc -l)

if [ $HOSTS_OK = '0' ]
then
	echo "/etc/hosts configuring ..."
	cat srcs/requirements/nginx/conf/hosts >> /etc/hosts;
	echo "/etc/hosts configured"
	echo "installing packages needed ..."
	apt install make -y &&
	apt install vim -y &&
	apt install apt-utils -y &&
	apt install docker-compose -y &&
	apt install docker -y;
	echo "packages installed"
	echo "setting up local ssh service ..."
	systemctl enable ssh;
	echo "ssh service up"
	echo "enabling port forwarding"
	/sbin/sysctl net.ipv4.conf.all.forwarding=1;
	echo "creating user directories"
	mkdir -p ~/data/wp;
	mkdir -p ~/data/db;
	echo "install finished"
else
	echo "/etc/hosts already configured."
fi



