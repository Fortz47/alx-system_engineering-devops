# adjust the file descriptor limit for the Nginx process

file { '/etc/default/nginx':
  ensure  => present,
  content => template('./nginx_default.erb'),
} ->

# Restart Nginx
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/'
}
