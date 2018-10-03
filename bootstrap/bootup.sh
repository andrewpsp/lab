#!/bin/bash
########################################################################################################
#Author: Andrew Thompson 
#admin@entercloud.info
#2018 
########################################################################################################


#Bash script to add package repository 
# Targeting  Microk8s Docker  UI 


set -e 


### function to check filesystem design\ 
cd /vagrant
sudo mkdir -p /vagrant/data/log 



check_dir ()
{
	data_dir="/vagrant/data"
	data_log="/vagrant/data/log"
	
	if [ -d $data_dir ]
	then
		echo -e "\n$data_dir is already locked and loaded\n" 
 	else 
 		sudo mkdir -p $data_dir
 	fi   
}  


# set up software repositories 
set_repo ()
{
	sudo apt-get update -yq
	sudo apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
   sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
   sudo apt-get update -yq

} 

#bootstrap the node with the common workhorse tools"
install_common( )
{
    #due to interminitent error messages each package is installed on its own line verses compacting. 
	sudo apt-get install -yq default-jre
	sudo apt-get install -yq docker-ce
	sudo snap install microk8s --classic --beta
	sudo snap alias microk8s.kubectl kubectl
	sudo apt-get update -yq
	#sudo systemctl docker start 
} 



docker_init()
{
if [d /var/lib/docker]

	export DOCKERCLOUD_USER=$docker_username
	export DOCKERCLOUD_USER=$docker_apikey



}

check_dir
set_repo
install_common
docker_init
