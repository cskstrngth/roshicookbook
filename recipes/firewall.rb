#
# Cookbook Name:: roshicookbook
# Recipe:: firewall
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

include_recipe 'firewall::default'

# Read attributes.
http_allow_in_source = node.default['roshicookbook']['http_allow_in_source']
http_allow_in_port = node.default['roshicookbook']['http_allow_in_port']

# Apply http_allow_in rule.
# Only allow inbound traffic on TCP/port from specified source IP range.
firewall_rule 'http_allow_in' do
  port      http_allow_in_port
  source    http_allow_in_source
  protocol  :tcp
  direction :in
  command   :allow
end
