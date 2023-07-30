# not used 
class profile::xml_testing {
  file { '/tmp/server.hsconf':
    ensure => file,
  }

  xml_fragment { 'appsetting':
    ensure  => 'present',
    path    => '/tmp/server.hsconf',
    xpath   => "/EnvironmentConfiguration/PlatformDatabaseConfiguration/server[@encrypted='false']",
    content => {
      attributes => {
        "Server encrypted='false'" => 'yeeeahhhboy',
      },
    },
  }
}
