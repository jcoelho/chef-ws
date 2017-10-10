#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "nginx" do
	action	:install
end

[node["nginx"]["dir"], node["nginx"]["log_dir"]].each do |dir|
  directory dir do
    owner "root"
    group "root"
    mode "0755"
    recursive true
  end
end

template "nginx.conf" do
  path "#{node["nginx"]["dir"]}/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode  "0644"
  notifies :restart, "service[nginx]"
end

cookbook_file "#{node["nginx"]["dir"]}/mime.types" do
  source "mime.types"
  owner "root"
  group "root"
  mode  "0644"
  notifies :restart, "service[nginx]"
end

%w[sites-available sites-enabled].each do |vhost_dir|
  directory "#{node["nginx"]["dir"]}/#{vhost_dir}" do
    owner  "root"
    group  "root"
    mode   "0755"
    action :create
  end
end

# ensure default site is removed if necessary
%w[sites-available sites-enabled].each do |dir|
  file "#{node["nginx"]["dir"]}/#{dir}/default" do
    action :delete
    only_if { node["nginx"]["skip_default_site"] }
    notifies :restart, "service[nginx]"
  end
end

node["nginx"]["sites"].each do |sitename, data|
  document_root = "#{node["nginx"]["default_vhost_dir"]}/#{sitename}"

  directory document_root do
    mode "0755"
    recursive true
  end

  template "#{sitename}.conf" do
    path "#{node["nginx"]["dir"]}/sites-enabled/#{sitename}.conf"
    source "site.erb"
    mode  "0644"
    variables ({
      :listen =>  data["port"],
      :host =>  data["domain"],
      :root =>  document_root,
      :index =>  "index.html",
      :location =>  document_root,
      :access_log =>  true
    })
    notifies :restart, "service[nginx]"
  end
end

node["nginx"]["conf_files"].each do |config_file|
  template config_file do
    path "#{node["nginx"]["dir"]}/conf.d/#{config_file}.conf"
    source "#{config_file}.conf.erb"
    owner "root"
    group "root"
    mode  "0644"
    notifies :restart, "service[nginx]"
  end
end

service "nginx" do
	supports status: true, restart: true, reload: true
  action  [:enable, :start]
end

include_recipe "php7::default"

