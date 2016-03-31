#
# Cookbook Name:: roshicookbook
# Recipe:: web
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

# Install nginx from package.
package 'nginx' do
  action :install
end

# Enable and start nginx service.
service 'nginx' do
  action [ :enable, :start ]
end
