# firewall
default['firewall']['allow_ssh'] = true
default['roshicookbook']['http_allow_in_source'] = '172.31.32.0/24'
default['roshicookbook']['http_allow_in_port'] = 80

# nginx
default['roshicookbook']['nginx']['user'] = 'www-data'
default['roshicookbook']['nginx']['conf'] = '/etc/nginx/nginx.conf'
default['roshicookbook']['nginx']['worker_processes'] = 1
default['roshicookbook']['nginx']['worker_connections'] = 512
#default['roshicookbook']['nginx']['init_conf'] = '/etc/init/nginx.conf'
#default['roshicookbook']['nginx']['path'] = '/usr/sbin/nginx'
#default['roshicookbook']['nginx']['pid_file'] = '/var/run/nginx.pid'

# roshidocker
# github.com/cskstrngth/roshibuilder
# github.com/cskstrngth/roshidocker
default['roshicookbook']['roshidocker']['repo'] = 'quay.io/cskstrngth/roshidocker'
default['roshicookbook']['roshidocker']['name'] = 'roshidocker'
default['roshicookbook']['roshidocker']['tag'] = 'latest'
default['roshicookbook']['roshidocker']['port'] = 6302

# redis
default['roshicookbook']['redis']['user'] = 'redis'
default['roshicookbook']['redis']['path'] = '/usr/bin/redis-server'
default['roshicookbook']['redis']['conf'] = '/etc/redis/redis.conf'
default['roshicookbook']['redis']['port'] = 6379
default['roshicookbook']['redis']['service_name'] = 'redis-server-upstart'
