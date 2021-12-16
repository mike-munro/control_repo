class profile::base {

user { 'dawud':
  ensure  => 'present',
  comment => 'David Sastre Medina,,,',
  groups  => ['root'],
  home    => '/home/dawud',
  shell   => '/bin/bash',
}

  package { 'vim':
    ensure      => present,
  }

include ngnix
}
