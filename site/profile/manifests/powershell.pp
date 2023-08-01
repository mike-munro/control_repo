class profile::powershell {
  exec { 'install_nuget_provider':
    command  => 'powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force"',
    provider => 'powershell',
    creates  => 'C:/Program Files/PackageManagement/ProviderAssemblies/NuGet',
  }
}
