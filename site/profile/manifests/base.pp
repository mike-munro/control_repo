class profile::base {

  user {'admin':
    ensure => present
  }

  file { '/root/README':
    ensure  => file,
    content => 'This is a readme, some more info goes here',
    owner   => 'root',
  }
}
