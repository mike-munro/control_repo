# not used 
class profile::app {

  file {'xml':
    ensure => file,
    path   => '/tmp/hosts.xml',
  }

# Apply the updated value using the xml_fragment::fragment resource
xml_fragment { 'update_server_value':
  path       => '/tmp/server.hsconf',  # Replace with the actual path to your XML file
  xpath      => '/EnvironmentConfiguration/PlatformDatabaseConfiguration/Server',
  value      => '<Server encrypted="false">new-server-value</Server>',
  selboolean => true,
}
}
