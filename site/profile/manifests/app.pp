# not used 
class profile::app {

file {'xml':
  ensure => file,
  path   => '/tmp/hosts.xml',
}


xml_fragment { 'Hosts':
  ensure  => 'present',
  path    => '/tmp/hosts.xml',
  xpath   => "/hosts/host[@ip='127.0.0.1']",
  content => {
      value      => 'Localhost',
      attributes => {
          'ip' => '127.0.0.1'
      }
}
}
