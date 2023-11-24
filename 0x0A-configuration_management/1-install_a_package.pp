# install a package flask, using pip3 provider

package { 'flask':
  ensure   => '2.1.0',
  name     => 'flask',
  provider => 'pip3',
}
