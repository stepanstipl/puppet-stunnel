# == Class: stunnel::tun
#
# This manages stunnel individual tunnels
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

define stunnel::tun (
  $servicename = $name,
  $accept = '',
  $ca_path = '',
  $ca_file = '',
  $cert = '',
  $ciphers = '',
  $client = false,
  $connect = '',
  $crl_path = '',
  $crl_file = '',
  $curve = '',
  $delay = false,
  $failover = 'rr',
  $ident = '',
  $key = '',
  $libwrap = false,
  $local = '',
  $options = '',
  $protocol = '',
  $protocol_authentication = '',
  $protocol_host = '',
  $protocol_password = '',
  $protocol_username = '',
  $redirect = '',
  $renegotiation = true,
  $reset = true,
  $session_cache_size = '',
  $session_cache_timeout = '',
  $sessiond = '',
  $ssl_version = 'TLSv1',
  $stack = '',
  $timeout_busy = '',
  $timeout_close = '',
  $timeout_connect = '',
  $timeout_idle = '',
  $transparent = 'none',
  $verify = 'default' ) {

  validate_re($servicename, '^[a-zA-Z- ]$')

  validate_host_service($accept)

  unless empty ($ca_path) {
    validate_string($ca_path)
  }

  unless empty ($ca_file)
    validate_string($ca_file)
  }

  unless empty ($cert) {
    validate_absolute_path($cert)
  }

  validate_string($ciphers)

  validate_bool ($client)

  unless empty ($crl_path) {
    validate_absolute_path($crl_path)
  }

  unless empty ($crl_file) {
    validate_absolute_path($crl_file)
  }

  validate_host_service($connect)

  validate_string($curve)

  validate_bool($delay)

  validate_re($failover,'^(rr|prio)$')

  validate_string($ident)

  unless empty($key) {
    validate_absolute_path($key)
  }

  validate_bool($libwrap)

  unless empty($local) {
    validate_host($local)
  }

  validate_string($options)

  unless empty($protocol) {
    validate_re($protocol, '^(cifs|connect|imap|nntp|pgsql|pop3|proxy|smtp)$')
  }

  unless empty($protocol_authentication) {
    validate_re($protocol_authentication, '^(basic|ntlm)$')
  }

  unless empty($protocol_host) {
    validate_host_service($protocol_host)
  }

  validate_string($protocol_password)

  validate_string($protocol_username)

  unless empty($redirect) {
    validate_host_service($redirect)
  }

  validate_bool($renegotiation)

  validate_bool($reset)

  unless empty($session_cache_size) {
    validatee_re($session_cache_size,'^[0-9]+$')
  }

  unless empty($session_cache_timeout) {
    validate_re($session_cache_timeout,'^[0-9]+$')
  }

  unless empty($sessiond) {
    validate_host_service($sessiond_port)
  }

  require stunnel

  # Check that we have certificate & key when we're server
  unless $client {
    if empty($cert) {
      fail('When running in server mode, $cert needs to be set.')
    }

    if empty($key) {
      fail('When running in server mode, $key needs to be set.')
  }

  $client_value = $client ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { "${servicename}-client":
    ensure  => present,
    section => $servicename,
    setting => 'client',
    value   => $client_value
  }

  stunnel_config { "${servicename}-accept":
    ensure  => present,
    section => $servicename,
    setting => 'accept',
    value   => $accept
  }

  stunnel_config { "${servicename}-connect":
    ensure  => present,
    section => $servicename,
    setting => 'connect',
    value   => $connect
  }

  unless empty($ca_path) {
    stunnel_config { "${servicename}-ca_path":
      ensure  => present,
      section => $servicename,
      setting => 'CApath',
      value   => $ca_path
    }
  }

  unless empty($ca_file) {
    stunnel_config { "${servicename}-ca_file":
      ensure  => present,
      section => $servicename,
      setting => 'CAfile',
      value   => $ca_file
    }
  }

  unless empty($cert) {
    stunnel_config { "${servicename}-cert":
      ensure  => present,
      section => $servicename,
      setting => 'cert',
      value   => $cert
    }
  }

  unless empty($ciphers) {
    stunnel_config { "${servicename}-ciphers":
      ensure  => present,
      section => $servicename,
      setting => 'ciphers',
      value   => $ciphers
    }
  }

  unless empty($crl_path) {
    stunnel_config { "${servicename}-crl_path":
      ensure  => present,
      section => $servicename,
      setting => 'CRLpath',
      value   => $crl_path
    }
  }

  unless empty($crl_file) {
    stunnel_config { "${servicename}-crl_file":
      ensure  => present,
      section => $servicename,
      setting => 'CRLfile',
      value   => $crl_file
    }
  }

  unless empty($curve) {
    stunnel_config { "${servicename}-curve":
      ensure  => present,
      section => $servicename,
      setting => 'curve',
      value   => $curve
    }
  }

  $delay_value = $delay ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { "${servicename}-delay":
    ensure  => present,
    section => $servicename,
    setting => 'delay',
    value   => $delay_value
  }

  unless empty($failover) {
    stunnel_config { "${servicename}-failover":
      ensure  => present,
      section => $servicename,
      setting => 'failover',
      value   => $failover
    }
  }

  unless empty($ident) {
    stunnel_config { "${servicename}-ident":
      ensure  => present,
      section => $servicename,
      setting => 'ident',
      value   => $ident
    }
  }

  unless empty($key) {
    stunnel_config { "${servicename}-key":
      ensure  => present,
      section => $servicename,
      setting => 'key',
      value   => $key
    }
  }

  $libwrap_value = $libwrap ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { "${servicename}-libwrap":
    ensure  => present,
    section => $servicename,
    setting => 'libwrap',
    value   => $libwrap_value
  }

  unless empty($options) {
    stunnel_config { "${servicename}-options":
      ensure  => present,
      section => $servicename,
      setting => 'options',
      value   => $options
    }
  }

  unless empty($protocol) {
    stunnel_config { "${servicename}-protocol":
      ensure  => present,
      section => $servicename,
      setting => 'protocol',
      value   => $protocol
    }
  }

  unless empty($protocol_authentication) {
    stunnel_config { "${servicename}-protocol_authentication":
      ensure  => present,
      section => $servicename,
      setting => 'protocolAuthentication',
      value   => $protocol_authentication
    }
  }

  unless empty($protocol_host) {
    stunnel_config { "${servicename}-protocol_host":
      ensure  => present,
      section => $servicename,
      setting => 'protocolHost',
      value   => $protocol_host
    }
  }

  unless empty($protocol_password) {
    stunnel_config { "${servicename}-protocol_password":
      ensure  => present,
      section => $servicename,
      setting => 'protocolPassword',
      value   => $protocol_password
    }
  }

  unless empty($protocol_username) {
    stunnel_config { "${servicename}-protocol_username":
      ensure  => present,
      section => $servicename,
      setting => 'protocolUsername',
      value   => $protocol_username
    }
  }

  $renegotiation_value = $renegotiation ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { "${servicename}-renegotiation":
    ensure  => present,
    section => $servicename,
    setting => 'renegotiation',
    value   => $renegotiation_value
  }

  $reset_value = $reset ? {
    true  => 'yes',
    false => 'no'
  }
  stunnel_config { "${servicename}-reset":
    ensure  => present,
    section => $servicename,
    setting => 'reset',
    value   => $reset_value
  }

  unless empty($session_cache_size) {
    stunnel_config { "${servicename}-session_cache_size":
      ensure  => present,
      section => $servicename,
      setting => 'sessionCacheSize',
      value   => $session_cache_size
    }
  }

  unless empty($session_cache_timeout) {
    stunnel_config { "${servicename}-session_cache_timeout":
      ensure  => present,
      section => $servicename,
      setting => 'sessionCacheTimeout',
      value   => $session_cache_timeout
    }
  }

  unless empty($sessiond) {
    stunnel_config { "${servicename}-sessiond":
      ensure  => present,
      section => $servicename,
      setting => 'sessiond',
      value   => $sessiond
    }
  }

  unless empty($ssl_version) {
    stunnel_config { "${servicename}-ssl_version":
      ensure  => present,
      section => $servicename,
      setting => 'sslVersion',
      value   => $ssl_version
    }
  }

  unless empty($stack) {
    stunnel_config { "${servicename}-stack":
      ensure  => present,
      section => $servicename,
      setting => 'stack',
      value   => $stack
    }
  }

  unless empty($timeout_busy) {
    stunnel_config { "${servicename}-timeout_busy":
      ensure  => present,
      section => $servicename,
      setting => 'TIMEOUTbusy',
      value   => $timeout_busy
    }
  }

  unless empty($timeout_close) {
    stunnel_config { "${servicename}-timeout_close":
      ensure  => present,
      section => $servicename,
      setting => 'TIMEOUTclose',
      value   => $timeout_close
    }
  }

  unless empty($timeout_connect) {
    stunnel_config { "${servicename}-timeout_connect":
      ensure  => present,
      section => $servicename,
      setting => 'TIMEOUTconnect',
      value   => $timeout_connect
    }
  }

  unless empty($timeout_idle) {
    stunnel_config { "${servicename}-timeout_idle":
      ensure  => present,
      section => $servicename,
      setting => 'TIMEOUTidle',
      value   => $timeout_idle
    }
  }

  unless empty($transparent) {
    stunnel_config { "${servicename}-transparent":
      ensure  => present,
      section => $servicename,
      setting => 'transparent',
      value   => $transparent
    }
  }



}
