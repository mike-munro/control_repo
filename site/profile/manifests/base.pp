# Base profile for all linux
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

  file { '/root/README':
    ensure  => file,
    content => 'This is a readme, some more info goes here',
    owner   => 'root',
  }
}
