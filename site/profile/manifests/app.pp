# not used 
class profile::app {

  file {'xml':
    ensure => file,
    path   => '/tmp/hosts.xml',
  }


  xml_fragment { 'Hosts':
    ensure  => 'present',
    path    => '/tmp/hosts.xml',
    xpath   => "/PlatformDatabaseConfiguration']",
    content => {
      value      => 'Server',
      attributes => {
        'ip' => '127.0.0.1'
      }
    }
  }
}

