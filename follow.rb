require 'fileutils'
require './const'

	
class Follow	
	def build(cluster, project, boxId, config)
		conf= cluster[boxId]
		boxName = project + "." + boxId
		FileUtils.touch(boxName)
		config.vm.define boxName do |node|
			node.vm.box = conf[:box]
			node.vm.network "private_network", ip: conf[:ip]
			cluster.each_with_index do |(boxId, info), index|
				node.vm.provision :shell, privileged: true, :path => 'bootstrap/bootup.sh', :args => [info[:ip], boxId, info[:alias]]
			end
			node.vm.provider :virtualbox do |v|
				v.memory = conf[:mem]
				v.name = boxName
			end
			node.vm.synced_folder "/Users/andrew/source_code/a_lab_demo", "/vagrant/"
			node.vm.synced_folder ".", "/vagrant/a_lab_demo" 
			node.vm.provision :shell, privileged: true, :path => 'bootstrap/bootup.sh'
		end
	end
	
end