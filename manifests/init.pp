# == Class: stunnel
#
# This class allows you to install and configure stunnel and manage
# individual connections.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { stunnel:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Stepan Stipl <stepan@stipl.net>
#
# === Copyright
#
# Copyright 2014 Stepan Stipl
#
class stunnel (
  $ensure          = $stunnel::params::ensure,
  $package_name    = $stunnel::params::package_name,
  $package_version = $stunnel::params::package_version,
  $package_ensure  = $stunnel::params::package_ensure,
  $service_manage  = $stunnel::params::service_manage,
  $service_enable  = $stunnel::params::service_enable,
  $service_ensure  = $stunnel::params::service_ensure,
) inherits stunnel::params {

  validate_bool($service_manage)
  validate_bool($service_enable)

  $my_package_ensure = $ensure ? {
    'present' => $package_version,
    default => absent
  }

  anchor {'stunnel::begin': }  ->
  class {'stunnel::install': } ->
  class {'stunnel::config': }  ->
  class {'stunnel::service': } ->
  anchor {'stunnel::end': }

}
