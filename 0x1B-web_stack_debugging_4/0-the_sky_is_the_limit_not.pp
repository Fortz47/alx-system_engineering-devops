# adjust the file descriptor limit for the Nginx process

file { '/etc/default/nginx':
  ensure  => present,
  content => template('module_name/nginx_default.erb'),
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  subscribe  => File['/etc/default/nginx'],
}

