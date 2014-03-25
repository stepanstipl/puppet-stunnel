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
  $service_manage  = $stunnel::params::service_manage,
  $service_enable  = $stunnel::params::service_enable,
  $service_ensure  = $stunnel::params::service_ensure,
  $init_overwrite  = $stunnel::params::init_overwrite,
  $purge_config    = $stunnel::params::purge_config,
  $chroot          = $stunnel::params::chroot,
  $compression     = $stunnel::params::compression,
  $debug_level     = $stunnel::params::debug_level,
  $debug_facility  = $stunnel::params::debug_facility,
  $fips            = $stunnel::params::fips,
  $foreground      = $stunnel::params::foreground,
  $log             = $stunnel::params::log,
  $output          = $stunnel::params::output,
  $pid             = $stunnel::params::pid,
  $setgid          = $stunnel::params::setgid,
  $setuid          = $stunnel::params::setuid,
  $socket          = $stunnel::params::socket,
  $syslog          = $stunnel::params::syslog

) inherits stunnel::params {

  validate_string($package_name)
  validate_string($package_version)
  validate_re( $ensure, '^(present|absent)$')
  validate_bool($service_enable)
  validate_bool($service_ensure)
  validate_bool($service_manage)
  validate_bool($init_overwrite)
  validate_bool($purge_config)
  validate_string($chroot)
  validate_re($compression, ['^(deflate|zlib|rle)$', ''])
  validate_string($debug_level)
  validate_string($debug_facility)
  validate_bool($fips)
  validate_bool($foreground)
  validate_re($log, ['^(append|overwrite)$'])
  validate_absolute_path($output)
  validate_absolute_path($pid)
  validate_string($setgid)
  validate_string($setuid)
  validate_string($socket)
  validate_bool($syslog)

  anchor {'stunnel::begin': }  ->
  class {'stunnel::install': } ->
  class {'stunnel::config': }  ->
  class {'stunnel::service': } ->
  anchor {'stunnel::end': }

}
