# Base profile for all linux
class profile::win_base {
  file { 'c://temp':
    ensure => directory,
  }
  file { 'c://temp/README.txt':
    ensure  => file,
    content => 'This is a readme, some more info goes here',
  }

  dsc { 'iis':
    resource_name => 'WindowsFeature',
    module        => 'PSDesiredStateConfiguration',
    properties    => {
      ensure => 'present',
      name   => 'Web-Server',
    },
  }
}
