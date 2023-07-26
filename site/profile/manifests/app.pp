# not used 
class profile::app {

file {'xml':
  ensure => file,
  path   => '/tmp/hosts.xml',
}


xml_fragment { 'Hosts':
  ensure => 'present',
  path   => '/tmp/hosts.xml',
  xpath  => '/hosts',
  purge  => true
}
}
