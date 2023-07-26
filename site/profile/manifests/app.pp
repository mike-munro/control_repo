# not used 
class profile::app {

# Import the xml_fragment module
include xml_fragment

# Define the updated value for the <Server> element
$updated_server_value = '<Server encrypted="false">new-server-value</Server>'

# Apply the updated value using the xml_fragment::xml_fragment resource
xml_fragment { 'update_server_value':
  data     => $updated_server_value,
  xpath    => '/EnvironmentConfiguration/PlatformDatabaseConfiguration/Server',
  in_place => true,
  content  => '/tmp/server.hsconf',
}


}
