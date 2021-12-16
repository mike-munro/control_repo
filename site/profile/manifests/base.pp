# Base profile for all linux
class profile::base {

user { 'mmunro':
  ensure  => 'present',
  comment => 'Munro,,,',
  groups  => ['root'],
  home    => '/home/mmunro',
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
