# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  ####################
  ###### CONFIG ######
  ####################
  config.vm.hostname = "grunter.local"
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "./", "/vagrant",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=775"]
  config.vm.synced_folder "C:/src", "/src",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=775"]


  ####################
  #### VIRTUALBOX ####
  ####################
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1048"]
  end
  
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  ####################
  # PUPPET-LIBRARIAN #
  ####################
  config.vm.provision :shell, :path => "puppet/install-librarian.sh"

  ####################
  ###### PUPPET ######
  ####################
  config.vm.provision "puppet" do |puppet|
    puppet.options = ["--parser future"]

    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"

    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.manifest_file  = "default.pp"
  end
end
