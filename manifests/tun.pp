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
  $accept_host = '',
  $accept_port = '',
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
  $protocol_port = '',
  $protocol_password = '',
  $protocol_username = '',
  $pty = false,
  $redirect_host = '',
  $redirect_port = '',
  $renegotiation = true,
  $reset = true,
  $session_cache_size = '',
  $session_cache_timeout = '',
  $sessiond_host = '',
  $sessiond_port = '',
  $ssl_version = 'TLSv1',
  $stack = '',
  $timeout_busy = '',
  $timeout_close = '',
  $timeout_connect = '',
  $timeout_idle = '',
  $transparent = 'none',
  $verify = 'default' ) {

  validate_re($servicename, '^[a-zA-Z- ]$')

  unless (empty($accept_host) or is_ip_address($accept_host)) {
    validate_re($accept_host, [ '^[a-zA-Z0-9.-]$', '^::$' ] )
  }

  unless (emoty($accept_port) {
    validate_re($accept_port, '^a-zA-Z0-9-_$'
  }

    validate_string($ca_path)

    validate_string($ca_file)

  unless empty ($cert) {
    validate_absolute_path($cert)
  }

    validate_string($ciphers)

  validate_bool ($client)

  validate_string($crl_path)
  
  validate_string($crl_file)
  
  unless empty ($connect) {
    if is_array($connect) {
      $connect.each |$val| {
        validate_re($val, '^[a-zA-Z0-9.-:]$')
      } else {
        validate_re($connect, '^[a-zA-Z0-9.-:]$')
      }
    }
  }

  validate_string($curve)

  validate_bool($delay)

  validate_re($failover.'^(rr|prio)$')

  validate_string($ident)

  unless empty($key) {
    validate_absolute_path($key)
  }

  validate_bool($libwrap)

  unless ( empty($local) or is_ip_address($local) ) {
    validate_re($local,'^[a-zA-Z0-9.-]')
  }

  validate_string($options)

  unless empty($protocol) {
    validate_re($protocol, '^(cifs|connect|imap|nntp|pgsql|pop3|proxy|smtp)$')
  }

  unless empty($protocol_authentication) {
    validate_re($protocol_authentication, '^(basic|ntlm)$')
  }

  unless ( empty($protocol_host) or is_ip_address($protocol_host) ) {
    validate_re($protocol_host,'^[a-zA-Z0-9.-]$')
  }

  unless empty($protocol_port) {
    validate_re($protocol_port,'^[a-zA-Z0-9-]$')
  }

  validate_string($protocol_password)

  validate_string($protocol_username)

  validate_bool($pty)

  unless empty($redirect_host) {
    validate_re($redirect_host,'^[a-zA-Z0-9.-]$')
  }

  unless empty($redirect_port) {
    validate_re($redirect_port,'^[a-zA-Z0-9-]$')
  }

  validate_bool($renegotiation)

  validate_bool($reset)

  unless empty($session_cache_size) {
    validatee_re($session_cache_size,'^[0-9]$')
  }

    unless empty($session_cache_timeout) {
          validatee_re($session_cache_timeout,'^[0-9]$')
            }

  unless empty($seddiond_host) {
    validate_re($seddiond_host,'^[a-zA-Z0-9.-]$')
  }

  unless empty($seddiond_port) {
    validate_re($seddiond_port,'^[a-zA-Z0-9-]$')
  }


  require stunnel

  
}
