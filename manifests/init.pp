# irssi
#
# Install and configure irssi
#
# @summary Install and configure irssi
#
# @example
#   include irssi
class irssi {
  include irssi::install
  include irssi::configure

  Class['irssi::install'] -> Class['irssi::configure']
}
