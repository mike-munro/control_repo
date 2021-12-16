class profile::base {

user { 'dawud':
  ensure  => 'present',
  comment => 'David Sastre Medina,,,',
  gid     => '1001',
  groups  => ['sudo'],
  home    => '/home/dawud',
  shell   => '/bin/bash',
  uid     => '1001',
}

  package { 'vim':
    ensure      => present,
  }

  file { '/home/admin/.vimrc':
    ensure => file,
    source => 'puppet:///modules/dev_environment/vimrc',
  }
}
