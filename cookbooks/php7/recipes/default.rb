#
# Cookbook:: php7
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

["php71","php71-fpm"].each do |p|
  package p do
    action :install
  end
end

template "www.conf" do
  path "#{node["php"]["php_fpm_dir"]}/www.conf"
  source "www.conf.erb"
  owner "root"
  group "root"
  mode  "0644"
  notifies :restart, "service[php-fpm]"
end

cookbook_file "#{node["php"]["php_ini_file"]}" do 
  source "php.ini"
  mode  "0644"
  notifies :restart, "service[php-fpm]"
end

service "php-fpm" do
	supports status: true, restart: true, reload: true
  action  [:enable, :start]
end
