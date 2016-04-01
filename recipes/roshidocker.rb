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
docker_image 'quay.io/cskstrngth/roshidocker' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[roshidocker]'
end

# Run the container.
docker_container 'roshidocker' do
  repo 'quay.io/cskstrngth/roshidocker'
  tag 'latest'
  port '6302:6302'
  command "-redis.instances=localhost:6379"
end
