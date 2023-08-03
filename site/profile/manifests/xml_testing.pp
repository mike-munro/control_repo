#
class profile::windows::xml_mod (
) {

  xml_fragment { 'Default_Web_Site1':
    ensure  => present,
    path    => 'C:\\temp\\apphost.config',
    xpath   => "/configuration/location[@path=\"TestSite\"]/system.webServer/isapiFilters",
  }

  xml_fragment { 'Default_Web_Site2':
    ensure  => present,
    path    => 'C:\\temp\\apphost.config',
    xpath   => "/configuration/location[@path=\"TestSite\"]/system.webServer/isapiFilters/filter",
    content => {
      attributes => {
        'name'         => 'OutSystemsISAPIFilter',
        'path'         => 'C:\\temp',
        'preCondition' => 'bitness64',
      },
    },
    require => Xml_fragment['Default_Web_Site1']
  }
}

