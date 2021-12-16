class profile::base {

  user {'admin':
    ensure      => present,
    manage_home => true,
    group       => ['wheel'],
  }

  package { 'vim':
    ensure      => present,
  }

  # file { '/home/admin/.vimrc':
  #   ensure => file,
  #   source => 'puppet:///modules/dev_environment/vimrc',
  # }
}
