# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "selenium-berkshelf"
  config.vm.box = "windows_2008_r2"
  config.vm.communicator = "winrm"
  
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", 2048, "--cpus", 2]
  end
  
  config.berkshelf.enabled = true
  
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
        "recipe[windows::reboot_handler]",
        "recipe[selenium-cluster::windows]",
    ]
  end
end
