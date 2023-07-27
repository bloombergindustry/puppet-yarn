# See README.md for usage information
class yarn (
  String $package_ensure     = $yarn::params::package_ensure,
  String $package_name       = $yarn::params::package_name,
  Boolean $manage_repo        = $yarn::params::manage_repo,
  Enum['npm','source','package'] $install_method     = $yarn::params::install_method,
  String $source_install_dir = $yarn::params::source_install_dir,
  String $symbolic_link      = $yarn::params::symbolic_link,
  String $user               = $yarn::params::user,
  String $source_url         = $yarn::params::source_url
) inherits yarn::params {
  class { 'yarn::repo':
    manage_repo  => $manage_repo,
    package_name => $package_name,
  }

  ~> class { 'yarn::install':
    package_ensure     => $package_ensure,
    package_name       => $package_name,
    install_method     => $install_method,
    source_install_dir => $source_install_dir,
    symbolic_link      => $symbolic_link,
    user               => $user,
    source_url         => $source_url,
  }

  contain yarn::repo
  contain yarn::install
}
