	# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative './follow'

vagrant_api_version = 2
project = "Ent-log"
cluster = {
	"k8s_4k" => { :ip => "192.168.12.200", :mem => 2048, :box => "ubuntu/bionic64", :instructType => "build", :alias => "k8s_4k"}
}


puts "variables init"
Vagrant.configure(vagrant_api_version) do |config|
	cluster.each_with_index do |(boxId, info), index|
        Follow.new.send(info[:instructType], cluster, project, boxId, config)
	end        
end