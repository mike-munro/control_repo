# Base profile for all linux
class profile::base {
  user { 'bob':
    ensure  => 'present',
    comment => 'Bob,,,',
    groups  => ['root'],
    home    => '/home/bob',
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
