#
# Cookbook Name:: roshicookbook
# Recipe:: redis
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

# Install redis server from package.
package 'redis-server' do
  action :install
end

# Enable and start redis service.
service "redis-server" do
  action [ :enable, :start ]
end
