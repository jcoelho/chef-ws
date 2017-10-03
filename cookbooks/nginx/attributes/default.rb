#
# Cookbook:: nginx
# Attributes:: default

# In order to update the version, the checksum attribute must be changed too.
# This attribute is defined in the source.rb attribute file
default['nginx']['version']      = '1.12.1'
default['nginx']['package_name'] = 'nginx'
default['nginx']['port']         = '80'
default['nginx']['dir']          = '/etc/nginx'
default['nginx']['script_dir']   = '/usr/sbin'
default['nginx']['log_dir']      = '/var/log/nginx'
default['nginx']['log_dir_perm'] = '0750'
default['nginx']['binary']       = '/usr/sbin/nginx'
default['nginx']['default_vhost_dir'] = '/var/www'
default['nginx']['default_root'] = '/var/www/nginx-default'
default['nginx']['ulimit']       = '1024'
default['nginx']['pid_file']     = '/var/run/nginx.pid'
default['nginx']['default_type'] = 'application/octet-stream'
# Platform is Amazon Linux
default['nginx']['user'] = 'nginx'
default['nginx']['gzip']              = 'on'
default['nginx']['gzip_static']       = 'off'
default['nginx']['gzip_http_version'] = '1.0'
default['nginx']['gzip_comp_level']   = '2'
default['nginx']['gzip_proxied']      = 'any'
default['nginx']['gzip_vary']         = 'off'
default['nginx']['gzip_buffers']      = nil
default['nginx']['gzip_types'] = %w(
  text/plain
  text/css
  application/x-javascript
  text/xml
  application/xml
  application/rss+xml
  application/atom+xml
  image/svg+xml
  text/javascript
  application/javascript
  application/json
  text/mathml
)
default['nginx']['gzip_min_length']   = 1000
default['nginx']['gzip_disable']      = 'MSIE [1-6]\.'
# Buffers
default['nginx']['buffers_enable']              = false
default['nginx']['client_body_temp_path']       = nil
default['nginx']['client_body_buffer_size']     = nil
default['nginx']['client_header_buffer_size']   = nil
default['nginx']['client_max_body_size']        = nil
default['nginx']['large_client_header_buffers'] = nil

default['nginx']['keepalive']            = 'on'
default['nginx']['keepalive_requests']   = 100
default['nginx']['keepalive_timeout']    = 65
default['nginx']['worker_processes']     = 'auto'
default['nginx']['worker_connections']   = 1024
default['nginx']['worker_rlimit_nofile'] = nil
default['nginx']['multi_accept']         = false
default['nginx']['event']                = nil
default['nginx']['accept_mutex_delay']   = nil
default['nginx']['server_tokens']        = nil
default['nginx']['server_names_hash_bucket_size'] = 64
default['nginx']['variables_hash_max_size']       = 1024
default['nginx']['variables_hash_bucket_size']    = 64
default['nginx']['types_hash_max_size']    = 2048
default['nginx']['types_hash_bucket_size']    = 64
default['nginx']['sendfile'] = 'on'
default['nginx']['underscores_in_headers'] = nil
default['nginx']['tcp_nodelay'] = 'on'
default['nginx']['tcp_nopush'] = 'on'
default['nginx']['skip_default_site'] = true
default['nginx']['client_body_timeout']    = 5
default['nginx']['client_header_timeout']    = 5
default['nginx']['send_timeout']    = 5
default['nginx']['conf_files'] = %w[
  timeouts  buffers
]
# Virtual hosts
default['nginx']['sites']['www1'] = {"port" => "80", "domain" => "www1.joseluiscuello.com"}
default['nginx']['sites']['www2'] = {"port" => "80", "domain" => "www2.joseluiscuello.com"}
