#
class profile::powershell {
  # Install NuGet Package Provider
  exec { 'install_nuget_provider':
    command  => 'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force',
    provider => 'powershell',
    creates  => 'C:/Program Files/PackageManagement/ProviderAssemblies/NuGet',
  }

  # Install NuGet Package Management PowerShell module
  exec { 'install_nuget_module':
    command  => 'Install-Module -Name NuGet -Force -SkipPublisherCheck',
    provider => 'powershell',
    creates  => 'C:/Program Files/PackageManagement/ProviderAssemblies/NuGet/2.8.5.208',
  }

  $modules_to_install = [
    'carbon.iis',
    'carbon',  # Add more module names as needed
    'Puppet.Dsc',
  ]

  # Install PowerShell modules using iteration
  $modules_to_install.each |$module| {
    exec { "install_${module}_module":
      command  => "Install-Module -Name ${module} -Force -SkipPublisherCheck",
      provider => 'powershell',
      creates  => "C:/Program Files/PackageManagement/ProviderAssemblies/NuGet/2.8.5.208/${module}",
    }
  }
}
