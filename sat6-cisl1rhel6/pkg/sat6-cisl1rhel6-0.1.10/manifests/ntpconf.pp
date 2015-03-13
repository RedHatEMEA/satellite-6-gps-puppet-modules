# = Class: cisl1rhel6::ntpconf
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
class cisl1rhel6::ntpconf (

  $cis_3_6_enabled = $cisl1rhel6::params::cis_3_6_enabled,
  $cis_ntp_servers = $cisl1rhel6::params::cis_ntp_servers

) inherits cisl1rhel6::params {

  notify{"[ntp] cis_3_6_enabled   = '${cis_3_6_enabled}'": }
  notify{"[ntp] cis_ntp_servers   = '${cis_ntp_servers}'": }


  # CIS 3.6
  if $cis_3_6_enabled {

    package { 'ntp':
      ensure => installed,
    }

    file { 'ntp_conf_file':
      ensure  => present,
      path    => '/etc/ntp.conf',
      content => template('cisl1rhel6/ntp.conf.erb'),
      owner   => root,
      group   => root,
      mode    => '0644',
      notify  => Service['ntpd'],
    }

    service { 'ntpd':
      enable => true,
      ensure => running,
    }
  }

}
