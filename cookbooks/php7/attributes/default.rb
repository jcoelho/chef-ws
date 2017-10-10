#
# Cookbook:: php7
# Attributes:: default

# In order to update the version, the checksum attribute must be changed too.
# This attribute is defined in the source.rb attribute file
default['php']['version']      = '7.1'
default['php']['package_name'] = 'php71'
default['php']['php_ini_file'] = '/etc/php.ini'
default['php']['php_fpm_dir']  = '/etc/php-fpm.d'
default['php']['user']  = 'nginx'
default['php']['group']  = 'nginx'
