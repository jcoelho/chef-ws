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

service "php-fpm" do
	supports status: true, restart: true, reload: true
  action  [:enable, :start]
end
