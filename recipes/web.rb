#
# Cookbook Name:: roshicookbook
# Recipe:: web
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

# Install nginx from package.
package 'nginx' do
  action :install
end

# Stop and disable the init.d style service if it exists
# NOTE: It looks like the service_name property is ignored
#       when controlling a service. So the service 'name'
#       must equal to the service we are controlling.
service 'nginx' do
  service_name 'nginx'
  action [ :stop, :disable ]
  only_if { File.exists?('/etc/init.d/nginx') }
end

# Remove init.d service script if it exists.
execute 'remove-redis-server-init.d' do
  command 'rm /etc/init.d/nginx'
  only_if { File.exists?('/etc/init.d/nginx') }
end

# Create Upstart configuration.
template "/etc/init/#{node.default['roshicookbook']['nginx']['service_name']}.conf" do
  source 'init-nginx.conf.erb'
end

# Overwrite nginx configuration with template resource.
# This resource should enable reverse proxy functionality.
template node.default['roshicookbook']['nginx']['conf'] do
  source 'nginx.conf.erb'
end

# Start the Upstart service.
service node.default['roshicookbook']['nginx']['service_name'] do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
  subscribes :restart, node.default['roshicookbook']['nginx']['conf'], :immediately
end
