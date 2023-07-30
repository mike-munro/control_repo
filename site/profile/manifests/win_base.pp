# Base profile for all linux
class profile::win_base {
  file { 'c://temp':
    ensure => directory,
  }

  file { 'c://temp/README.txt':
    ensure  => file,
    content => 'This is a readme, some more info goes here',
  }

# Install the package
  package { 'git':
    ensure   => installed,
    provider => 'chocolatey',
  }

  $iis_features = ['Web-WebServer','Web-Scripting-Tools','Web-Mgmt-Console','Web-ISAPI-Ext','Web-ISAPI-Filter']

  iis_feature { $iis_features:
    ensure => 'present',
  }

  package { 'microsoft-edge':
    ensure   => installed,
    provider => 'chocolatey',
  }

# Create Directories

  file { 'c:\\inetpub\\complete':
    ensure => 'directory',
  }

  file { 'c:\\inetpub\\complete_vdir':
    ensure => 'directory',
  }

# Configure IIS

  iis_application_pool { 'complete_site_app_pool':
    ensure                  => 'present',
    state                   => 'started',
    managed_pipeline_mode   => 'Integrated',
    managed_runtime_version => 'v4.0',
  }

# Application Pool No Managed Code .Net CLR Version set up
  iis_application_pool { 'test_app_pool':
    ensure                    => 'present',
    enable32_bit_app_on_win64 => true,
    managed_runtime_version   => '',
    managed_pipeline_mode     => 'Classic',
    start_mode                => 'AlwaysRunning',
  }

  iis_site { 'complete':
    ensure           => 'started',
    physicalpath     => 'c:\\inetpub\\complete',
    applicationpool  => 'complete_site_app_pool',
    enabledprotocols => 'http',
    bindings         => [
      {
        'bindinginformation' => '*:80:',
        'protocol'           => 'http',
      },
    ],
    require          => File['c:\\inetpub\\complete'],
  }

  iis_virtual_directory { 'vdir':
    ensure       => 'present',
    sitename     => 'complete',
    physicalpath => 'c:\\inetpub\\complete_vdir',
    require      => File['c:\\inetpub\\complete_vdir'],
  }

  # exec { 'add_isapi_filter':
  #   command  => 'C:/Windows/System32/inetsrv/appcmd.exe set config -section:system.webServer/isapiFilters /+"[name=\'SalesQueryIsapi\',path=\'c:\\Inetpub\\minimal\\filters\\SalesQueryIsapi.dll\',enabled=\'True\',enableCache=\'True\']" /commit:apphost',
  #   onlyif   => '(C:/Windows/System32/inetsrv/appcmd.exe list config -section:system.webServer/isapiFilters) -notmatch \'SalesQueryIsapi\'',
  #   provider => 'powershell',
  # }

  xml_fragment { 'SalesQueryIsapi':
    ensure  => present,
    xpath   => '/configuration/system.webServer/isapiFilters',
    content => {
      'filter' => {
        '@name'        => 'SalesQueryIsapi',
        '@path'        => 'c:\\Inetpub\\minimal\\filters\\SalesQueryIsapi.dll',
        '@enabled'     => 'true',
        '@enableCache' => 'true',
      },
    },
    path    => 'C://Inetpub//wwwroot//web.config',
    notify  => Service['iis'],
  }

  service { 'iis':
    ensure => 'running',  # or 'stopped' to ensure it is stopped
    enable => true,       # Set to true to start the service at system boot
  }
}
