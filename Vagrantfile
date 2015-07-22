# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.box_url = "https://atlas.hashicorp.com/puppetlabs/boxes/centos-7.0-64-puppet"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
	
  config.vm.define "hub" do |node_1|
	node_1.vm.network "private_network", ip: "192.168.1.10"
    node_1.vm.hostname = "hub-demo"
    node_1.vm.network :forwarded_port, host: 4444, guest: 4444
    node_1.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet-scripts/node-1/manifests"
      puppet.module_path = "puppet-scripts/node-1/modules"
      puppet.manifest_file = "site.pp"
      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define "node" do |node_2|
	node_2.vm.network "private_network", ip: "192.168.1.11"
    node_2.vm.hostname = "node-demo"
    node_2.vm.network :forwarded_port, host: 5555, guest: 5555
    node_2.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet-scripts/node-2/manifests"
      puppet.module_path = "puppet-scripts/node-2/modules"
      puppet.manifest_file = "site.pp"
      puppet.options = "--verbose --debug"
    end
  end

end




