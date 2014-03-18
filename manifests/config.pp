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

}
