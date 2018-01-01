# irssi::user_config
#
# Create irssi configuration directory and file for a user
#
# @summary Configure irssi for a user
#
# @example
#   irssi::user_config { 'namevar': }
define irssi::user_config(
  String $owner,
  String $config_dir = $name,
  Hash[String, Hash] $networks = {},
  String $real_name = 'Irssi User',
  String $user_name = 'irssiuser',
  String $nick_name = 'irssiuser',
  Array[Hash[String, String]] $windows = [],
) {
  file { $config_dir:
    ensure => directory,
    mode   => '0664',
    owner  => $owner,
    group  => $owner,
  }
  file { "${config_dir}/config":
    ensure  => file,
    mode    => '0660',
    owner   => $owner,
    group   => $owner,
    content => template('irssi/config.erb'),
  }
}
