# == Class: stunnel::params
#
# Default parameters for stunnel class
#
# === Authors
#
# Stepan Stipl <stepan@stipl.net>
#
# === Copyright
#
# Copyright 2014 Stepan Stipl
#

class stunnel::params {

  $ensure          = 'present'

  $package_name    = 'stunnel'
  $package_version = 'latest'

  $service_manage  = true
  $service_enable  = true
  $service_ensure  = true

  $init_overwrite  = false

  $purge_config    = true

  # stunnel global options
  $chroot          = ''
  $compression     = ''
  $debug_level     = ''
  $debug_facility  = ''
  $fips            = false
  $foreground      = false
  $log             = 'append'
  $output          = '/var/log/stunnel.log'
  $pid             = '/var/run/stunnel.pid'
  $setgid          = ''
  $setuid          = ''
  $socket          = ''
  $syslog          = true

}
