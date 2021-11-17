node default {
  file { '/root/README':
    ensure  => file,
    content => 'This is a readme, some more info goes here',
    owner   => 'root',
  }
}
node 'master.puppet.vm' {
  include role::master_server
}
