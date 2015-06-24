# = Class: cisl1rhel6::hostsaccess
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
class cisl1rhel6::hostsaccess (

  $cis_4_5_2_enabled    = $cisl1rhel6::params::cis_4_5_2_enabled,
  $cis_4_5_3_enabled    = $cisl1rhel6::params::cis_4_5_3_enabled,
  $cis_4_5_4_enabled    = $cisl1rhel6::params::cis_4_5_4_enabled,
  $cis_4_5_5_enabled    = $cisl1rhel6::params::cis_4_5_5_enabled

) inherits cisl1rhel6::params {

  notify{"[hostsaccess] cis_4_5_2_enabled   = '${cis_4_5_2_enabled}'": }
  notify{"[hostsaccess] cis_4_5_3_enabled   = '${cis_4_5_3_enabled}'": }
  notify{"[hostsaccess] cis_4_5_4_enabled   = '${cis_4_5_4_enabled}'": }
  notify{"[hostsaccess] cis_4_5_5_enabled   = '${cis_4_5_5_enabled}'": }


  package { 'setup':
    ensure => installed,
  }

  # CIS 4.5.2, 4.5.3
  if $cis_4_5_2_enabled and $cis_4_5_3_enabled {

    file { 'etc_hosts_allow_file':
      ensure  => file,
      path    => '/etc/hosts.allow',
      source  => 'puppet:///modules/cisl1rhel6/hosts.allow',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

  # CIS 4.5.4, 4.5.5 (warning: blocks root ssh access if not host not listed)
  if $cis_4_5_4_enabled and $cis_4_5_5_enabled {

    file { 'etc_hosts_deny':
      ensure  => file,
      path    => '/etc/hosts.deny',
      source  => 'puppet:///modules/cisl1rhel6/hosts.deny',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

}
