# not used 
class profile::app {

  # Apply the updated value using the xml_fragment::fragment resource
  xml_fragment { 'update_server_value':
    ensure => 'present',
    path   => '/tmp/server.hsconf',
    xpath  => '/EnvironmentConfiguration/PlatformDatabaseConfiguration/Server/<Server encrypted="false">new-server-value</Server>',
  }

}
