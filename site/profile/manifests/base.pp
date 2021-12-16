class profile::base {

  user {'admin':
    ensure      => present,
    manage_home => ture,
    group       => ['wheel'],
  }

  package { 'vim':
    ensure      => present,
  }

  file { '/home/admin/.vimrc':
    ensure => file,
    source => 'puppet:///modules/dev_environment/vimrc',
  }
}
