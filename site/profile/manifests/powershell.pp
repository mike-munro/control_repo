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
    creates  => 'C:/Program Files/PowerShell/Modules/NuGet',
  }
}
