# irssi::user_config
#
# Create irssi configuration directory and file for a user
#
# @summary Configure irssi for a user
#
# @example
#   irssi::user_config { 'namevar': }
define irssi::user_config(
  String $config_dir,
  Hash[String, Hash] $networks = {},
  String $real_name = 'Irssi User',
  String $user_name = 'irssiuser',
  String $nick_name = 'irssiuser',
  Array[Hash[String, String]] $windows = [],
) {
  file { $config_dir:
    ensure => directory,
    mode   => '0664',
    owner  => $user_name,
    group  => $user_name,
  }
  file { "${config_dir}/config":
    ensure  => file,
    mode    => '0660',
    owner   => $user_name,
    group   => $user_name,
    content => template('irssi/config.erb'),
  }
}
