# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "local.domain.se"

  config.omnibus.chef_version = :latest

  config.vm.box = "cloudimg-trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :private_network, ip: "192.168.33.31"

  config.vm.synced_folder "path/to/your/site/folder/", "/var/www/domain.se",
    owner: "www-data",
    group: "deploy",
    mount_options: ["dmode=775,fmode=664"]

  config.vm.provider :virtualbox do |vb|
    vb.name = "local.domain.se"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = "data_bags"
    chef.environments_path = "environments"
    chef.environment = "local"
    chef.run_list = [
        "recipe[vagrant-appserver::default]"
    ]
  end
end
