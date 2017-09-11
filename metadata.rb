name             'vagrant-appserver'
maintainer       'Arvid Bjorkstrom'
maintainer_email 'arvid@bjorkstrom.se'
license          'MIT'
description      'Installs/Configures vagrant-appserver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
supports 'ubuntu', '>= 12.04.0'

depends 'appserver', '~>1.4.0' # https://github.com/arvidbjorkstrom/chef-appserver
