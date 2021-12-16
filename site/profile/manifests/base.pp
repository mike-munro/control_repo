class profile::base {

user { 'dawud':
  ensure  => 'present',
  comment => 'David Sastre Medina,,,',
  gid     => '1001',
  groups  => ['root'],
  home    => '/home/dawud',
  shell   => '/bin/bash',
  uid     => '1001',
}

  package { 'vim':
    ensure      => present,
  }
}
