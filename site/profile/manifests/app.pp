# not used 
class profile::app {

  # Apply the updated value using the xml_fragment::fragment resource
  xml_fragment { 'update_server_value':
    ensure  => 'present',
    path    => '/tmp/server.hsconf',
    xpath   => '/EnvironmentConfiguration/PlatformDatabaseConfiguration/',
    content => {
        value      => 'Server',
        attributes => {
            'Server' => 'ballssssitsworking',
        }
    }
  }

}
