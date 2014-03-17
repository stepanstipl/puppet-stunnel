# == Class: stunnel::install
#
# This installs Stunnel packages
# See main Stunnel class for docs.
#
# === Authors
#
# Stepan Stipl <stepan@stipl.net>
#
# === Copyright
#
# Copyright 2014 Stepan Stipl
#

class stunnel::install inherits stunnel {

  package { 'stunnel':
    ensure => $my_package_ensure,
    name   => $package_name,
  }
}
