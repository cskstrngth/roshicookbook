#
# Cookbook Name:: roshicookbook
# Recipe:: default
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'roshicookbook::firewall'
include_recipe 'roshicookbook::web'
