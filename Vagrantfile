# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-12.04-amd64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 4444, host: 4444

  
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
      chef.add_recipe "selenium::node"
      chef.add_recipe "selenium::hub"
  end
  config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 4096, "--cpus", 2]
  end
end
