# == Class: stunnel::service
#
# This manages stunnel service
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

class stunnel::service {

  if $stunnel::service_manage == true {
    service { 'stunnel':
      ensure     => $stunnel::service_ensure,
      enable     => $stunnel::service_enable,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
