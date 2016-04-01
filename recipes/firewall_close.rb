#
# Cookbook Name:: roshicookbook
# Recipe:: firewall_close
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

# Reject all inbound traffic.
firewall_rule 'deny_incoming' do
  raw 'default deny incoming'
  notifies :restart, 'firewall[default]', :immediately
end
