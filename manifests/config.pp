# == Class: stunnel::config
#
# This configures stunnel
# See main stunnel class for docs.
#
# === Authors
#
# Stepan Stipl <stepan@stipl.net>
#
# === Copyright
#
# Copyright 2014 Stepan Stipl
#

class stunnel::config {

  if !empty($stunnel::debug_level) {
    if !empty($stunnel::debug_facility) {
      $debug = "${stunnel::debug_facility}.${stunnel::debug_level}"
    } else {
      $debug = $stunnel::debug_level
    }
  }

  if $stunnel::purge_config {
    if !defined(Resource['stunnel_config']) {
      resources { 'stunnel_config':
        purge => true
      }
    }
  }

  # Take care of individual config settings
  if !empty($stunnel::chroot) {
    stunnel_config { 'stunnel-chroot':
      ensure  => present,
      section => '',
      setting => 'chroot',
      value   => $stunnel::chroot
    }
  }

  if !empty($stunnel::compression) {
    stunnel_config { 'stunnel-compression':
      ensure  => present,
      section => '',
      setting => 'compression',
      value   => $stunnel::compression
    }
  }

  if !empty($stunnel::debug) {
    stunnel_config { 'stunnel-debug':
      ensure  => present,
      section => '',
      setting => 'debug',
      value   => $stunnel::debug
    }
  }

  $fips_value = $stunnel::fips ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { 'stunnel-fips':
    ensure  => present,
    section => '',
    setting => 'fips',
    value   => $fips_value
  }

  $foreground_value = $stunnel::foreground ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { 'stunnel-foreground':
    ensure  => present,
    section => '',
    setting => 'foreground',
    value   => $foreground_value
  }

  $syslog_value = $stunnel::syslog ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { 'stunnel-syslog':
    ensure  => present,
    section => '',
    setting => 'syslog',
    value   => $syslog_value
  }

  if !$stunnel::syslog {
    stunnel_config { 'stunnel-log':
      ensure  => present,
      section => '',
      setting => 'log',
      value   => $stunnel::log
    }

    stunnel_config { 'stunnel-output':
      ensure  => present,
      section => '',
      setting => 'output',
      value   => $stunnel::output
    }
  }

  stunnel_config { 'stunnel-pid':
    ensure  => present,
    section => '',
    setting => 'pid',
    value   => $stunnel::pid
  }

  if !empty($stunnel::setgid) {
    stunnel_config { 'stunnel-setgid':
      ensure  => present,
      section => '',
      setting => 'setgid',
      value   => $stunnel::setgid
    }
  }

  if !empty($stunnel::setuid) {
    stunnel_config { 'stunnel-setuid':
      ensure  => present,
      section => '',
      setting => 'setuid',
      value   => $stunnel::setuid
    }
  }

  if !empty($stunnel::socket) {
    stunnel_config { 'stunnel-socket':
      ensure  => present,
      section => '',
      setting => 'socket',
      value   => $stunnel::socket
    }
  }
}
