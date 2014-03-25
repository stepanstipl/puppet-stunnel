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

class stunnel::install {

  $my_package_ensure = $stunnel::ensure ? {
    'present' => $stunnel::package_version,
    default => absent
  }

  package { 'stunnel':
    ensure => $my_package_ensure,
    name   => $stunnel::package_name,
  } ->

  file {'/etc/init.d/stunnel':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/stunnel/stunnel.init',
    replace => $stunnel::init_overwrite
  }

}
