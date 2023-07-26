# not used 
class profile::app {

  file {'xml':
    ensure => file,
    path   => '/tmp/hosts.xml',
  }

# Define the updated value for the <Server> element
$updated_server_value = 

# Apply the updated value using the xml_fragment::fragment resource
xml_fragment::fragment { 'update_server_value':
  target     => '/tmp/server.hsconf',  # Replace with the actual path to your XML file
  xpath      => '/EnvironmentConfiguration/PlatformDatabaseConfiguration/Server',
  value      => '<Server encrypted="false">new-server-value</Server>',
  selboolean => true,
}
}
