# not used 
class profile::app {

  file {'xml':
    ensure => file,
    path   => '/tmp/hosts.xml',
  }

# Define the updated value for the <Server> element
$updated_server_value = '<Server encrypted="false">new-server-value</Server>'

# Apply the updated value using the xml_fragment::fragment resource
xml_fragment::fragment { 'update_server_value':
  target     => '/path/to/your/xml/file.xml',  # Replace with the actual path to your XML file
  xpath      => '/EnvironmentConfiguration/PlatformDatabaseConfiguration/Server',
  value      => $updated_server_value,
  selboolean => true,
}
}
