# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.network :forwarded_port, guest: 8000, host:8000 
  config.vm.network :private_network, ip: "192.168.234.131" 
  config.vm.hostname = "dev"
  config.ssh.forward_agent = true 

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end 

  config.vm.provision :shell, :path => "provision/bootstrap.sh"
end
