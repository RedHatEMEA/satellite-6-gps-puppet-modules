# = Class: cisl1rhel6::boot
#
# == Authors:
#
# Author Name <ghares@redhat.com>
#
# == Copyright:
#
# Copyright 2015 Red Hat Inc, unless otherwise noted.
#
#
class cisl1rhel6::boot (

  $cis_1_5_4_enabled    = $cisl1rhel6::params::cis_1_5_4_enabled,
  $cis_1_5_5_enabled    = $cisl1rhel6::params::cis_1_5_5_enabled,
  $cis_3_1_enabled      = $cisl1rhel6::params::cis_3_1_enabled

) inherits cisl1rhel6::params {

  notify{"[boot] cis_1_5_4_enabled  = '${cis_1_5_4_enabled}'": }
  notify{"[boot] cis_1_5_5_enabled  = '${cis_1_5_5_enabled}'": }
  notify{"[boot] cis_3_1_enabled    = '${cis_3_1_enabled}'": }

  # CIS 1.5.4
  if $cis_1_5_4_enabled {

    augeas { 'init-single-user-auth':
      context => '/files/etc/sysconfig/init',
      changes => 'set SINGLE /sbin/sulogin',
    }
  }

  # CIS 1.5.5
  if $cis_1_5_5_enabled {

    augeas { 'init-disable-interactive-boot':
      context => '/files/etc/sysconfig/init',
      changes => 'set PROMPT no',
    }
  }

  # CIS 3.1
  if $cis_3_1_enabled {

    augeas { 'init-default-umask':
      context => '/files/etc/sysconfig/init',
      changes => 'set umask 027',
    }
  }

}
