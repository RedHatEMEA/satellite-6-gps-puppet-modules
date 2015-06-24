# = Class: cisl1rhel6::syslogconf
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
class cisl1rhel6::syslogconf (

  $cis_5_1_1_enabled = $cisl1rhel6::params::cis_5_1_1_enabled,
  $cis_5_1_2_enabled = $cisl1rhel6::params::cis_5_1_2_enabled,
  $cis_5_1_3_enabled = $cisl1rhel6::params::cis_5_1_3_enabled,
  $cis_5_3_enabled = $cisl1rhel6::params::cis_5_3_enabled

) inherits cisl1rhel6::params {

  notify{"[syslogconf] cis_5_1_1_enabled   = '${cis_5_1_1_enabled}'": }
  notify{"[syslogconf] cis_5_1_2_enabled   = '${cis_5_1_2_enabled}'": }
  notify{"[syslogconf] cis_5_1_3_enabled   = '${cis_5_1_3_enabled}'": }
  notify{"[syslogconf] cis_5_3_enabled     = '${cis_5_3_enabled}'": }


  # CIS 5.1.1, 5.1.2, 5.1.3
  if $cis_5_1_1_enabled and $cis_5_1_2_enabled and $cis_5_1_3_enabled {

    package { 'rsyslog':
      ensure => installed,
    }

    file { 'rsyslog_conf_file':
      ensure  => present,
      path    => '/etc/rsyslog.conf',
      source  => 'puppet:///modules/cisl1rhel6/rsyslog.conf',
      owner   => root,
      group   => root,
      mode    => '0644',
      notify  => Service['rsyslog'],
    }

    service { 'rsyslog':
      enable => true,
      ensure => running,
      require => File['rsyslog_conf_file']
    }
  }

  # CIS 5.3    logrotate /etc/logrotate.d/syslog configured
  if $cis_5_3_enabled {

    file { 'logrotate_syslog_file':
      ensure  => present,
      path    => '/etc/logrotate.d/syslog',
      source  => 'puppet:///modules/cisl1rhel6/logrotate_syslog',
      owner   => root,
      group   => root,
      mode    => '0644',
    }
  }

}
