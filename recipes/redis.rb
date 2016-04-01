#
# Cookbook Name:: roshicookbook
# Recipe:: redis
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

# Install redis server from package.
package 'redis-server' do
  action :install
end

# Stop and disable init.d service.
service "redis-server" do
  provider Chef::Provider::Service::Init::Debian
  action [ :stop, :disable ]
end

# Create Upstart configuration.
template node.default['roshicookbook']['redis']['init_conf'] do
  source 'init-redis-server.conf.erb'
end

# Apply redis configuration.
template node.default['roshicookbook']['redis']['conf'] do
  source 'redis.conf.erb'
  notifies [ :restart ], 'service[redis-server]'
end

# Enable and start service via Upstart.
service "redis-server" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
