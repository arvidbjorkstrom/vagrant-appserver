# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'digital_ocean'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'domain.se'

  config.omnibus.chef_version = :latest

  config.vm.box = 'digital_ocean'
  config.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'

    provider.name = 'domain.se'
    provider.token = 'YOUR_API_KEY'
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'AMS2'
    provider.size = '1GB'
    provider.private_networking = true
    provider.backups_enabled = true
  end
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = 'data_bags'
    chef.environments_path = 'environments'
    chef.environment = 'production'
    chef.run_list = [
      'recipe[vagrant-appserver::default]'
    ]
  end
end
