# irssi::user_script
#
# Install and manage irssi user scripts
#
# @summary Install and manage irssi user scripts
#
# @example
#   irssi::user_script { 'namevar': }
define irssi::user_script(
  String $config_dir,
  String $owner,
  String $source,
  Optional[String] $user_config = undef,
  Boolean $autorun = false,
  String $script_name = $name,
) {
  if $user_config {
    $_user_config = $user_config
  } else {
    $_user_config = $config_dir
  }

  file { "${config_dir}/scripts/${script_name}":
    ensure  => file,
    owner   => $owner,
    group   => $owner,
    mode    => '0664',
    source  => $source,
    require => Irssi::User_config[$_user_config],
  }

  if $autorun {
    file { "${config_dir}/scripts/autorun/${script_name}":
      ensure  => link,
      owner   => $owner,
      group   => $owner,
      mode    => '0777',
      target  => "../${script_name}",
      require => Irssi::User_config[$_user_config],
    }
  }
}
