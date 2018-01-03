
# irssi

[![GitHub license](https://img.shields.io/badge/license-GPL-blue.svg)](https://raw.githubusercontent.com/brwyatt/puppet-irssi/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/brwyatt/puppet-irssi.svg)](https://github.com/brwyatt/puppet-irssi/issues)
[![GitHub forks](https://img.shields.io/github/forks/brwyatt/puppet-irssi.svg)](https://github.com/brwyatt/puppet-irssi/network)
[![GitHub stars](https://img.shields.io/github/stars/brwyatt/puppet-irssi.svg)](https://github.com/brwyatt/puppet-irssi/stargazers)

[![Puppet Forge](https://img.shields.io/puppetforge/v/brwyatt/irssi.svg)](https://forge.puppetlabs.com/brwyatt/irssi)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/brwyatt/irssi.svg)](https://forge.puppetlabs.com/brwyatt/irssi)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/brwyatt/irssi.svg)](https://forge.puppetlabs.com/brwyatt/irssi)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with irssi](#setup)
    * [What irssi affects](#what-irssi-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with irssi](#beginning-with-irssi)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)
1. [Contributors - List of those who've helped to make the module better](#contributors)

## Description

This module provides simple classes and types for installing the irssi chat client on a system, and setting up user configuration and scripts.

## Setup

### What irssi affects

This module installs the irssi package and may optionally be used to manage one or more user configuration directories.

### Setup Requirements

Currently, this module only supports Ubuntu (tested on Ubuntu 14.04), but will likely work on otehr Debian-based distributions.

### Beginning with irssi

To install this modual, call:

```bash
puppet module install brwyatt-irssi
```

## Usage

To install irssi on agent, simply include it into your manifests.

```puppet
include ::irssi
```

## Reference

* [Classes](#classes)
* [Defined Types](#defined-types)

### Classes

#### `irssi`
Installs and realizes user configuration for irssi by including `irssi::install` and `irssi::configure`.

#### `irssi::configure`
Realizes user configuration for irssi.

Realizes all `irssi::user_config` and `irssi::user_script` resources.

#### `irssi::install`
Installs the irssi package with the default system package provider.

Default values for class parameters are derived from Hiera data files in `irssi/data/`

Parameters:
* `package_ensure`: Package ensure value (defaults to "latest")
* `package_name`: Name of the package (defaults to "irssi" on Debian)

### Defined Types

#### `irssi::user_config`
Manages an irssi config directory and config file.

Parameters:
* `owner`: (required) System owner of the files and directories
* `config_dir`: (namevar) Path of the config directory to manage
* `networks`: Hash of networks and their configurations **TODO: Describe structure**
* `real_name`: Default real name of the user
* `user_name`: Default user name of the user
* `nick_name`: Default nick name of the user
* `windows`: Array of pre-defined windows and their settings **TODO: Describe structure**
* `purge_scripts`: Whether the scripts directory should have unmanaged scripts purged (default: false)

#### `irssi::user_script`
Manages scripts installed in a config directory.

Parameters:
* `config_dir`: (required) Config directory this script should be installed to
* `owner`: (required) System owner of the script
* `source`: (required) Source for the file
* `user_config`: (optional) Name of the `irssi::user_config` if named differently than the default `config_dir`
* `autorun`: Controls whether the script should be enabled to auto-load on irssi start. (default: false)
* `script_name`: (namevar) The filename for the script file

## Limitations

Currently, this module is only tested against Ubuntu 16.04. It will likely work on other Debian-based distributions, and may or may not work on RedHat-based distributions, but makes no claims regarding such.

## Development

Feel free to file issues in the GitHub [issue tracker](https://github.com/brwyatt/puppet-irssi/issues) for the repository, or submit [Pull Requests](https://github.com/brwyatt/puppet-irssi/pulls).

I may not have much time to work on (or test) this myself, so help to expand current functionality (especially to make it work for more people) is greatly appreciated and encouraged.


## Contributors

The list of contributors can be found at: [https://github.com/brwyatt/puppet-irssi/graphs/contributors](https://github.com/brwyatt/puppet-irssi/graphs/contributors).
