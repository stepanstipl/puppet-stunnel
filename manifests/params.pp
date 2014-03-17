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

  $service_manage  = true
  $service_enable  = true
  $service_running = true
  $service_ensure  = true

  $package_name    = 'stunnel'
  $package_version = 'latest'
  $ensure          = 'present'

}
