# = Class: cisl1rhel6::services
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
class cisl1rhel6::services (

  $cis_3_3_enabled    = $cisl1rhel6::params::cis_3_3_enabled,
  $cis_3_4_enabled    = $cisl1rhel6::params::cis_3_4_enabled,
  $cis_3_8_enabled    = $cisl1rhel6::params::cis_3_8_enabled

) inherits cisl1rhel6::params {

  notify{"[services] cis_3_3_enabled   = '${cis_3_3_enabled}'": }
  notify{"[services] cis_3_4_enabled   = '${cis_3_4_enabled}'": }
  notify{"[services] cis_3_8_enabled   = '${cis_3_8_enabled}'": }


  # CIS 3.3
  if $cis_3_3_enabled {

    service { 'avahi-daemon':
      ensure => 'stopped',
      enable => 'false',
    }
  }

  # CIS 3.4
  if $cis_3_4_enabled {

    service { 'cups':
      ensure => 'stopped',
      enable => 'false',
    }
  }

  # CIS 3.8
  if $cis_3_8_enabled {

    $nfs_svcs=['nfslock','rpcgssd','rpcbind','rpcidmapd','rpcsvcgssd']
    service { $nfs_svcs:
      ensure => 'stopped',
      enable => 'false',
    }
  }


}
