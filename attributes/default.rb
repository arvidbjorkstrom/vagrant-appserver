#
# Cookbook Name:: vagrant-appserver
# Recipe:: default
#

# Timezone
default['tz'] = 'Europe/Stockholm'

# MySQL
default['mysql']['server_root_password'] = 'i7T6zeTDoyqCWG'
default['mysql']['server_debian_password'] = 'i7T6zeTDoyqCWG'

default['mysql']['databases'] = [
  {
    'database' => 'dbname',
    'username' => 'dbuser',
    'password' => 'dbpass',
    'overwrite' => false
  }
]

# NGINX
default['nginx']['sites'] = [
  {
    'name' => 'domain.se',
    'host' => 'www.domain.se',
    'root' => '/var/www/domain.se/public',
    'index' => 'index.php index.html index.htm',
    'location' => 'try_files $uri $uri/ /index.php?$query_string',
    'phpfpm' => true,
    'template_source' => 'serverblock.conf.erb',
    'template_cookbook' => 'appserver',
    'environment' => 'prod',
    'artisan_migrate' => false,
    'composer_update' => true,
    'composer_update_path' => '/var/www/domain.se',
    'git' => true,
    'git_path' => '/var/www/domain.se',
    'git_repo' => 'git@bitbucket.org:gituser/domain.se.git',
    'git_branch' => 'master',
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
