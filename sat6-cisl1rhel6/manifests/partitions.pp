# = Class: cisl1rhel6::partitions
#
# This class manages elements associated with partitions and options
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
class cisl1rhel6::partitions (

  $cis_1_1_2_enabled      = $cisl1rhel6::params::cis_1_1_2_enabled,
  $cis_1_1_3_enabled      = $cisl1rhel6::params::cis_1_1_3_enabled,
  $cis_1_1_4_enabled      = $cisl1rhel6::params::cis_1_1_4_enabled,
  $cis_1_1_6_enabled      = $cisl1rhel6::params::cis_1_1_6_enabled,
  $cis_1_1_10_enabled     = $cisl1rhel6::params::cis_1_1_10_enabled,
  $cis_1_1_14_enabled     = $cisl1rhel6::params::cis_1_1_14_enabled,
  $cis_1_1_15_enabled     = $cisl1rhel6::params::cis_1_1_15_enabled,
  $cis_1_1_16_enabled     = $cisl1rhel6::params::cis_1_1_16_enabled

) inherits cisl1rhel6::params {

  notify{"[partitions] cis_1_1_2_enabled  = '${cis_1_1_2_enabled}'": }
  notify{"[partitions] cis_1_1_3_enabled  = '${cis_1_1_3_enabled}'": }
  notify{"[partitions] cis_1_1_4_enabled  = '${cis_1_1_4_enabled}'": }
  notify{"[partitions] cis_1_1_6_enabled  = '${cis_1_1_6_enabled}'": }
  notify{"[partitions] cis_1_1_10_enabled = '${cis_1_1_10_enabled}'": }
  notify{"[partitions] cis_1_1_14_enabled = '${cis_1_1_14_enabled}'": }
  notify{"[partitions] cis_1_1_15_enabled = '${cis_1_1_15_enabled}'": }
  notify{"[partitions] cis_1_1_16_enabled = '${cis_1_1_16_enabled}'": }


  file {'file_etc_fstab':
    path  => '/etc/fstab',
    owner => root,
    group => root,
    mode  => '0600',
  }

  # CIS 1.1.2, 1.1.3, 1.1.4
  if $cis_1_1_2_enabled and $cis_1_1_3_enabled and $cis_1_1_4_enabled {

    mount {'/tmp':
      ensure   => mounted,
      options  => 'nodev,nosuid,noexec',
      remounts => true,
      atboot   => true,
    }
  }

  # CIS 1.1.6
  if $cis_1_1_6_enabled {

    mount { '/var/tmp':
      ensure  => mounted,
      device  => '/tmp',
      fstype  => 'none',
      options => 'rw,noexec,nosuid,nodev,bind',
      atboot  => true,
    }
  }

  # CIS 1.1.10
  if $cis_1_1_10_enabled {

    mount {'/home':
      options  => 'rw,nodev',
      remounts => true,
      atboot   => true,
    }
  }

  # CIS 1.1.14, 1.1.15, 1.1.16
  if $cis_1_1_14_enabled and $cis_1_1_15_enabled and $cis_1_1_16_enabled {

    mount {'/dev/shm':
      device   => '/dev/shm',
      options  => 'nodev,nosuid,noexec',
      remounts => true,
      atboot   => true,
    }
  }

}
