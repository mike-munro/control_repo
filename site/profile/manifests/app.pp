# not used 
class profile::app {

  xml_fragment { 'appsetting':
    ensure  => 'present',
    path    => '/tmp/server.hsconf',
    xpath   => "/EnvironmentConfiguration/PlatformDatabaseConfiguration/server[@encrypted='false']",
    content => {
      attributes => {
        'value' => 'test',
      }
    }
  }
}
