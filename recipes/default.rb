#
# Cookbook Name:: roshicookbook
# Recipe:: default
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

include_recipe 'firewall::default'
include_recipe 'roshicookbook::firewall_close'
include_recipe 'apt::default'
include_recipe 'roshicookbook::web'
include_recipe 'roshicookbook::roshidocker'
include_recipe 'roshicookbook::redis'
include_recipe 'roshicookbook::firewall'
