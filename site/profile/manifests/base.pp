class profile::base {

  user {'admin':
    name       => 'admin',
    ensure     => present,
    managehome => true,
  }

  package { 'vim':
    ensure      => present,
  }

  file { '/home/admin/.vimrc':
    ensure => file,
    source => 'puppet:///modules/dev_environment/vimrc',
  }
}
