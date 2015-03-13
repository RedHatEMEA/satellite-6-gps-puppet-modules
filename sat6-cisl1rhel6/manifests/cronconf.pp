# = Class: cisl1rhel6::cronconf
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
class cisl1rhel6::cronconf (

  $cis_6_1_1_enabled = $cisl1rhel6::params::cis_6_1_1_enabled,
  $cis_6_1_2_enabled = $cisl1rhel6::params::cis_6_1_2_enabled,
  $cis_6_1_3_enabled = $cisl1rhel6::params::cis_6_1_3_enabled,
  $cis_6_1_4_enabled = $cisl1rhel6::params::cis_6_1_4_enabled,
  $cis_6_1_5_enabled = $cisl1rhel6::params::cis_6_1_5_enabled,
  $cis_6_1_6_enabled = $cisl1rhel6::params::cis_6_1_6_enabled,
  $cis_6_1_7_enabled = $cisl1rhel6::params::cis_6_1_7_enabled,
  $cis_6_1_8_enabled = $cisl1rhel6::params::cis_6_1_8_enabled,
  $cis_6_1_9_enabled = $cisl1rhel6::params::cis_6_1_9_enabled

) inherits cisl1rhel6::params {

  notify{"[cronconf] cis_6_1_1_enabled   = '${cis_6_1_1_enabled}'": }
  notify{"[cronconf] cis_6_1_2_enabled   = '${cis_6_1_2_enabled}'": }
  notify{"[cronconf] cis_6_1_3_enabled   = '${cis_6_1_3_enabled}'": }
  notify{"[cronconf] cis_6_1_4_enabled   = '${cis_6_1_4_enabled}'": }
  notify{"[cronconf] cis_6_1_5_enabled   = '${cis_6_1_5_enabled}'": }
  notify{"[cronconf] cis_6_1_6_enabled   = '${cis_6_1_6_enabled}'": }
  notify{"[cronconf] cis_6_1_7_enabled   = '${cis_6_1_7_enabled}'": }
  notify{"[cronconf] cis_6_1_8_enabled   = '${cis_6_1_8_enabled}'": }
  notify{"[cronconf] cis_6_1_9_enabled   = '${cis_6_1_9_enabled}'": }


  package { 'cronie':
    ensure => installed,
  }

  package { 'crontabs':
    ensure => installed,
  }


  # CIS 6.1.1, 6.1.3
  if $cis_6_1_1_enabled  and $cis_6_1_3_enabled {

    file { 'anacontab_file':
      ensure  => file,
      path    => '/etc/anacrontab',
      owner   => root,
      group   => root,
      mode    => '0600',
    }
  }

  # CIS 6.1.2, 6.1.4
  if $cis_6_1_2_enabled  and $cis_6_1_4_enabled {

    file { 'crontab_file':
      ensure  => file,
      path    => '/etc/crontab',
      owner   => root,
      group   => root,
      mode    => '0644',
      notify  => Service['crond'],
    }

    service { 'crond':
      enable => true,
      ensure => running,
      require => File['crontab_file']
    }
  }

  # CIS 6.1.5
  if $cis_6_1_5_enabled {

    file { 'cron_hourly_directory':
      ensure  => directory,
      path    => '/etc/cron.hourly',
      owner   => root,
      group   => root,
      mode    => '0755',
    }
  }

  # CIS 6.1.6
  if $cis_6_1_6_enabled {

    file { 'cron_daily_directory':
      ensure  => directory,
      path    => '/etc/cron.daily',
      owner   => root,
      group   => root,
      mode    => '0755',
    }
  }
  # CIS 6.1.7
  if $cis_6_1_7_enabled {

    file { 'cron_weekly_directory':
      ensure  => directory,
      path    => '/etc/cron.weekly',
      owner   => root,
      group   => root,
      mode    => '0755',
    }
  }
  # CIS 6.1.8
  if $cis_6_1_8_enabled {

    file { 'cron_monthly_directory':
      ensure  => directory,
      path    => '/etc/cron.monthly',
      owner   => root,
      group   => root,
      mode    => '0755',
    }
  }
  # CIS 6.1.9
  if $cis_6_1_9_enabled {

    file { 'cron_d_directory':
      ensure  => directory,
      path    => '/etc/cron.d',
      owner   => root,
      group   => root,
      mode    => '0755',
    }
  }

  # CIS 6.1.10
  if $cis_6_1_10_enabled {

    file { 'at_allow_file':
      ensure  => file,
      path    => '/etc/at.allow',
      content => "",
      owner   => root,
      group   => root,
      mode    => '0644',
    }

    file { 'at_deny_file':
      ensure  => file,
      path    => '/etc/at.deny',
      content => "",
      owner   => root,
      group   => root,
      mode    => '0644',
    }
  }

  # CIS 6.1.11
  if $cis_6_1_11_enabled {

    file { 'cron_allow_file':
      ensure  => file,
      path    => '/etc/cron.allow',
      content => "",
      owner   => root,
      group   => root,
      mode    => '0644',
    }

    file { 'cron_deny_file':
      ensure  => file,
      path    => '/etc/cron.deny',
      content => "",
      owner   => root,
      group   => root,
      mode    => '0644',
    }
  }

}
