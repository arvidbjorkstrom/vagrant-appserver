#
# Cookbook Name:: vagrant-appserver
# Recipe:: default
#

# Swap file, multiples of the server memory size
default['swapsize'] = 2

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

# Redis
default['redisio']['servers'] = [
  {
    'port' => '6379',
    'name' => 'redisname',
    'requirepass' => 'redispass'
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
    'artisan_migrate' => false,
    'artisan_subpath' => 'artisan',
    'composer_install' => true,
    'composer_subpath' => '',
    'npm_install' => true,
    'npm_subpath' => '',
    'bower_install' => true,
    'bower_subpath' => '',
    'gulp_run' => true,
    'gulp_subpath' => '',
    'git' => true,
    'git_subpath' => '',
    'git_repo' => 'git@bitbucket.org:gituser/domain.se.git',
    'git_branch' => 'master',
    'ssl' => true,
    'ssl_key' => '-----BEGIN RSA PRIVATE KEY-----
MIICXQIBAAKBgQDKut9ZkP3nRp+tKlnoyne3qTngX9drYjnJoVb66c6GUmYFcBzJ
HtpAGHLucZvRro+jyu/zCBnKv+8Yg+lzPjwTZ+JGNZRWt2TriDGPH2AGlnnIh7Rs
FaIJwsq9xnHMfOWqdfn2gRKoCjGv4Q9l0gX1c83bKqWttF5VYUdnTjspDQIDAQAB
AoGAbM/wobpZDZGyktdweqpxp3qFPhEzJsgKDFc0wGhOGXqQl8qdKLYOnuiAh8si
v2DaaCe8ss1eSpzKUHY9D0YQJ8WtrmpZmGIJw31mH7pj36ec+aPMQLwMniseIkgn
pm+RMSfiC579D9A0Ln4r5CL09XMrZO679yHu0UlV9zb3HgECQQDqD52WWV2toeAG
v5XQPjws9rieNj/a/pfsd6kK9zKR+B60zJjCr4XgQyMt7kA3W5+4AF6T2I77egtK
j36kLulRAkEA3bt068qkw+Fldsdn3jbaG0lp6rsZA4Wefrpih1tJz4IfOMyTl1DN
acWSNrFYQ+hHlbg8LjqXjBN7zw2bXlBU/QJBALAHXnUccJ+NBncMzxb2Nzt5sg8K
rat9nbRxqehdUOMGv9Eprhl8+CpZU7PPYuw/NDelz3tRevcWKjfBA3Vm8oECQCJe
IdtCR5OM5hspATJyMhA0qtQVN+VR2qUt4oO0ZJZjRs+Y9e9oOM6CLw2HI3UzFZVh
PwKzVjYB9xi6tTBDJ0kCQQCeL3RPdqGY/JYYGAcW/CP+u3YZEr+csqwJZUpF9D5Z
Wa6WRiIyC1/UjTsjdqIbZAU/yigJhayp6MJqFrvvjDCq
-----END RSA PRIVATE KEY-----
',
    'ssl_crt' => '-----BEGIN CERTIFICATE-----
MIICnzCCAggCCQCoAIL9mIeyyTANBgkqhkiG9w0BAQUFADCBkzELMAkGA1UEBhMC
U0UxGjAYBgNVBAgMEVN0b2NraG9sbXMgTMODwqRuMRIwEAYDVQQHDAlTdG9ja2hv
bG0xGjAYBgNVBAoMEUFwcHNlcnZlciBDb21wYW55MRIwEAYDVQQDDAlkb21haW4u
c2UxJDAiBgkqhkiG9w0BCQEWFWluZm8gYXQgZG9tYWluIGRvdCBzZTAeFw0xNTAx
MTMxNjAzMzZaFw0xNjAxMTMxNjAzMzZaMIGTMQswCQYDVQQGEwJTRTEaMBgGA1UE
CAwRU3RvY2tob2xtcyBMw4PCpG4xEjAQBgNVBAcMCVN0b2NraG9sbTEaMBgGA1UE
CgwRQXBwc2VydmVyIENvbXBhbnkxEjAQBgNVBAMMCWRvbWFpbi5zZTEkMCIGCSqG
SIb3DQEJARYVaW5mbyBhdCBkb21haW4gZG90IHNlMIGfMA0GCSqGSIb3DQEBAQUA
A4GNADCBiQKBgQDKut9ZkP3nRp+tKlnoyne3qTngX9drYjnJoVb66c6GUmYFcBzJ
HtpAGHLucZvRro+jyu/zCBnKv+8Yg+lzPjwTZ+JGNZRWt2TriDGPH2AGlnnIh7Rs
FaIJwsq9xnHMfOWqdfn2gRKoCjGv4Q9l0gX1c83bKqWttF5VYUdnTjspDQIDAQAB
MA0GCSqGSIb3DQEBBQUAA4GBAJlIXdrCEWEvHxHFb1AaeOyeA9fg+62epN4d6pN2
5xa8x4QzBE3ovQA1OOYjfqAG9mfkDND00GpU7gwYJFcN+WjL0xHbjtG5xLUUnLmT
bhvFn46bC+m9dCpqKahjOFFzEOgveS9lEjN6n5ipKfIHbXI2EiLCiycam1QiSAZ/
rRQz
-----END CERTIFICATE-----
',
    'artisan_queuelisten' => true,
    'artisan_queueworkers' => 8,
    'artisan_queuelogpath' => 'storage/logs/worker.log',
    'artisan_cron' => [],
    'cronjobs' => [],
    'writeable_dirs' => [
      'storage/'
    ]
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
