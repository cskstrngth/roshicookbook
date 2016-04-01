# firewall
default['firewall']['allow_ssh'] = true
default['roshicookbook']['http_allow_in_source'] = '172.31.32.0/24'
default['roshicookbook']['http_allow_in_port'] = 80

# web
default['roshicookbook']['http_service']['user'] = 'www-data'
default['roshicookbook']['http_service']['worker_processes'] = 4
default['roshicookbook']['http_service']['worker_connections'] = 768

# roshidocker
default['roshicookbook']['roshidocker']['repo'] = 'quay.io/cskstrngth/roshidocker'
default['roshicookbook']['roshidocker']['name'] = 'roshidocker'
default['roshicookbook']['roshidocker']['tag'] = 'latest'
default['roshicookbook']['roshidocker']['port'] = 6302

# redis
default['roshicookbook']['redis']['port'] = 6379
