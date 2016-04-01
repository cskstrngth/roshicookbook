#
# Cookbook Name:: roshicookbook
# Recipe:: redis
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

# Install redis server from package.
package 'redis-server' do
  action :install
end

# Stop and disable the init.d style service if it exists
# NOTE: It looks like the service_name property is ignored
#       when controlling a service. So the service 'name'
#       must equal to the service we are controlling.
service 'redis-server' do
  service_name 'redis-server'
  action [ :stop, :disable ]
  only_if { File.exists?('/etc/init.d/redis-server') }
end

# Remove init.d service script if it exists.
execute 'remove-redis-server-init.d' do
  command 'rm /etc/init.d/redis-server'
  only_if { File.exists?('/etc/init.d/redis-server') }
end

# Create Upstart configuration.
template "/etc/init/#{node.default['roshicookbook']['redis']['service_name']}.conf" do
  source 'init-redis-server.conf.erb'
end

# Apply redis configuration, and notify service.
template node.default['roshicookbook']['redis']['conf'] do
  source 'redis.conf.erb'
end

# Start the Upstart service.
service node.default['roshicookbook']['redis']['service_name'] do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
