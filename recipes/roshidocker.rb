#
# Cookbook Name:: roshicookbook
# Recipe:: roshidocker
#
# Copyright (c) 2016 David Jee (cskstrngth), All Rights Reserved.

# Start the docker service.
docker_service 'default' do
  action [:create, :start]
end

# Pull the roshidocker image from quay.io public repo.
# github.com/cskstrngth/roshibuilder
# github.com/cskstrngth/roshidocker
docker_image node.default['roshicookbook']['roshidocker']['repo'] do
  tag node.default['roshicookbook']['roshidocker']['tag']
  action :pull
  notifies :redeploy, "docker_container[#{node.default['roshicookbook']['roshidocker']['name']}]"
end

# Run the container.
docker_container node.default['roshicookbook']['roshidocker']['name'] do
  repo node.default['roshicookbook']['roshidocker']['repo']
  tag node.default['roshicookbook']['roshidocker']['tag']
  port "#{node.default['roshicookbook']['roshidocker']['port']}:#{node.default['roshicookbook']['roshidocker']['port']}"
  network_mode 'host'
  restart_policy 'always'
  command "-redis.instances=localhost:#{node.default['roshicookbook']['redis']['port']}"
end
