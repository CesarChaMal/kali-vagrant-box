# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.define "kali-linux" do |kali|
		kali.vm.box = "kalilinux/rolling"
		kali.vm.box_check_update = false
		kali.vm.hostname = "kali-linux"
		kali.vm.provision "shell", path: "scripts/install.sh"
		kali.vm.provider "virtualbox" do |v|
			#Display the VirtualBox GUI when booting the machine
			v.gui = false
#			v.memory = 4096
			v.memory = 2048
#			v.memory = 1024
#			v.cpus = 2
   		end
	end
end
