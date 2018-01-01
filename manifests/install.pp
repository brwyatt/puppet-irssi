# irssi::install
#
# Installs irssi from system packages
#
# @summary Installs irssi
#
# @example
#   include irssi::install
class irssi::install (
  # Default values in `irssi/data/`
  String $package_ensure,
  String $package_name,
){
  package { $package_name:
    ensure => $package_ensure,
  }
}
