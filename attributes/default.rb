#
# Cookbook Name:: vagrant-appserver
# Recipe:: default
#

# Swap file, multiples of the server memory size
default['swapsize'] = 2

# Timezone
default['tz'] = 'Europe/Stockholm'

# MySQL
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

# NGINX config and Site install & deploy
default['nginx']['sites'] = [
  {
    'name' => 'domain.se',
    'base_path' => '/var/www/domain.se',
    'host' => 'www.domain.se',
    'webroot_subpath' => 'public',
    'index' => 'index.php index.html index.htm',
    'location' => 'try_files $uri $uri/ /index.php?$query_string',
    'phpfpm' => true,
    'template_source' => 'serverblock.conf.erb',
    'template_cookbook' => 'appserver',
    'environment' => 'prod',
    'db_host' => 'localhost',
    'db_database' => 'dbname',
    'db_username' => 'dbuser',
    'db_password' => 'dbpass',
    'compass_compile' => true,
    'compass_subpath' => '',
    'artisan_migrate' => true,
    'artisan_subpath' => 'artisan',
    'composer_install' => true,
    'composer_subpath' => '',
    'npm_install' => true,
    'npm_subpath' => '',
    'bower_install' => true,
    'bower_subpath' => '',
    'gulp_run' => true,
    'gulp_subpath' => '',
    'git' => false,
    'ssl' => false,
    'writeable_dirs' => []
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
default['opcache']['revalidate_freq'] = '1'
default['opcache']['fast_shutdown'] = '1'
default['opcache']['enable_cli'] = '1'
