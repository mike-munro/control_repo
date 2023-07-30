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

# Delete the default website to prevent a port binding conflict.
  iis_site { 'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }

  iis_site { 'minimal':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\minimal',
    applicationpool => 'DefaultAppPool',
    require         => [
      File['minimal'],
      Iis_site['Default Web Site']
    ],
  }

  file { 'minimal':
    ensure => 'directory',
    path   => 'c:\\inetpub\\minimal',
  }

exec { 'install_xwebadministration_module':
  command  => 'powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Install-Module -Name xWebAdministration -Force"',
  provider => 'powershell',
  unless   => 'powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Get-Module -Name xWebAdministration -ListAvailable"',
}


  dsc_lite { 'ISAPIFilterExample':
    dsc_resource_name       => 'xWebISAPIFilter',
    dsc_resource_module     => 'xWebAdministration',
    dsc_resource_properties => {
      Name        => 'SalesQueryIsapi',
      Path        => 'c:\\Inetpub\\www.contoso.com\\filters\\SalesQueryIsapi.dll',
      Ensure      => 'Present',
      Enabled     => true,
      EnableCache => true,
    },
  }
}
