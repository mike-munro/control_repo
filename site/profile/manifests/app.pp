# not used 
class profile::app {

  file {'xml':
    ensure => file,
    path   => '/tmp/hosts.xml',
  }


  xml_fragment { 'server.hsconf':
    ensure  => 'present',
    path    => '/tmp/server.hsconf',
    xpath   => "/EnvironmentConfiguration/PlatformDatabaseConfiguration']",
    content => {
      value      => 'Server',
      attributes => {
        'Server' => '127.0.0.1'
      }
    }
  }
}
