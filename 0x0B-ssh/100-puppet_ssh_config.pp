# Puppet to make changes to a configuration file

exec { 'make ssh_config writable':
  command     => '/usr/bin/chmod +w /etc/ssh/ssh_config',
  refreshonly => true,
}

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => '^#?\s*PasswordAuthentication',
  require => Exec['make ssh_config writable'],
}

file_line { 'Declare identity file':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
  match  => '^#?\s*IdentityFile',
}

exec { 'make ssh_config readonly':
  command => '/usr/bin/chmod -w /etc/ssh/ssh_config',
}
