# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "domain.se"

  config.omnibus.chef_version = :latest

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.token = 'YOUR_API_KEY'
    provider.image = 'Ubuntu 14.04 x64'
    provider.region = 'ams2'
    provider.size = '1024mb'
    provider.backups_enabled = true
  end

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = "data_bags"
    chef.run_list = [
        "recipe[vagrant-appserver::default]"
    ]
  end
end
