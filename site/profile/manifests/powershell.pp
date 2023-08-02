#
class profile::powershell {
  # Lookup the modules to be installed from Hiera data
  $modules_to_install = lookup('profile::powershell::modules_to_install', Array[String], [])

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

  # Install PowerShell modules using iteration
  $modules_to_install.each |$module| {
    exec { "install_${module}_module":
      command  => "Install-Module -Name ${module} -Force -SkipPublisherCheck",
      provider => 'powershell',
      unless   => "Get-Command '*' -Module ${module} -ErrorAction SilentlyContinue",
    }
  }
}
