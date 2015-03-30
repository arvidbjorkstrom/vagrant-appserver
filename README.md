# Vagrant Appserver

## Description

Vagrant template for use together with [chef-appserver](http://github.com/arvidbjorkstrom/chef-appserver)


## Requirements

### Supported Plattforms

The following platforms are supported by this cookbook, meaning that the
recipes should run on these platforms without error:

* Ubuntu 12.04
* Ubuntu 14.04

### Cookbooks

* [appserver](http://github.com/arvidbjorkstrom/chef-appserver) (check the cookbook [README](https://github.com/arvidbjorkstrom/chef-appserver#cookbooks) for more cookbook dependencies)

### Chef

It is recommended to use a version of Chef `>= 11.12.4` as that is the target of my usage and testing, though it will probably work with older versions as well.

### Ruby

This cookbook requires Ruby 1.9+ and is tested against:

* 1.9.3
* 2.0.0
* 2.1.2

### Vagrant

Uses [Vagrant](http://www.vagrantup.com) and the [Digital Ocean Provider](https://github.com/smdahlen/vagrant-digitalocean) for Digital Ocean deployment

## Usage

Clone or fork this repo and change the settings to suit your site. The [master](https://github.com/arvidbjorkstrom/vagrant-appserver/tree/master) repo is aimed at a local vagrant copy, and the [digitalocean](https://github.com/arvidbjorkstrom/vagrant-appserver/tree/digitalocean) branch is, to everyone's surprise, aimed at deployment on [Digital Ocean](https://www.digitalocean.com).
If you're going to use [Digital Ocean](https://www.digitalocean.com/?refcode=345cedb6329b), and you haven't got an account yet - use [my affiliate link](https://www.digitalocean.com/?refcode=345cedb6329b) when you register. You'll get $10, and I'll get a kickback if you continue using it.
> A tip is to search for "domain.se" in `attributes/default.rb` and `Vagrantfile`. Also make sure to add ssh keys to the deploy user data bag at `data_bags/users/deploy.json`


## Attributes

```ruby

# Swap file, multiples of the server memory size
default['swapsize'] = 2

# Timezone
default['tz'] = 'Europe/Stockholm'

# MySQL
default['mysql']['server_root_username'] = 'root'
default['mysql']['server_root_password'] = 'YouShouldReplaceThis'
default['mysql']['server_debian_password'] = 'YouShouldReplaceThis'

default['mysql']['databases'] = [
  {
    'database' => 'dbname',
    'username' => 'dbuser',
    'password' => 'dbpass',
    'overwrite' => true
  }
]


# NGINX
default['nginx']['sites'] = [
  {
    'name' => 'domain.se',
    'host' => 'domain.se www.domain.se',
    'root' => '/var/www/example.se/public',
    'listen' => '*.80',
    'index' => 'index.php index.html index.htm',
    'slashlocation' => 'try_files $uri $uri/ /index.php?$query_string',
    'phpfpm' => true,
    'templatesource' => 'serverblock.conf.erb',
    'templatecookbook' => 'appserver',
    'artisan_migrate' => true,
    'git' => true,
    'git_path' => '/var/www/example.se',
    'git_repo' => 'git@github.com:gitsite/deployment.git',
    'git_branch' => 'master'
  }
]

# PHP
default['php']['error_reporting'] = 'E_ALL'
default['php']['display_errors'] = 'Off'
default['php']['log_errors'] = 'On'
default['php']['post_max_size'] = '96M'
default['php']['upload_max_filesize'] = '64M'
default['php']['max_file_uploads'] = '20'
default['php']['memory_limit'] = '256M'

# OPcache
default['opcache']['enabled'] = '1'
default['opcache']['memory_consumption'] = '128'
default['opcache']['interned_strings_buffer'] = '8'
default['opcache']['max_accelerated_files'] = '4000'
default['opcache']['revalidate_freq'] = '60'
default['opcache']['fast_shutdown'] = '1'
default['opcache']['enable_cli'] = '1'
```

## TODO

Nothing here yet.


## License

* Freely distributable and licensed under the [MIT license](http://arvid.mit-license.org/).
* Copyright (c) 2012-2014 Arvid Björkström (arvid@bjorkstrom.se) [![endorse](https://api.coderwall.com/arvidbjorkstrom/endorsecount.png)](https://coderwall.com/arvidbjorkstrom)
