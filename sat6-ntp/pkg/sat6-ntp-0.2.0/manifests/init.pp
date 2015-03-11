# == Class: ntp
#
# Simple ntp class that is free standing, ie doesn't use stdlib
#
# === Parameters
#
# Document parameters here.
#
# [*ntpServers*]
#   Takes a comma separated list if servers/names
#
#   Default: 127.0.0.1
#
# === Authors
#
# Author Name <ghares@redhat.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class ntp (
  $ntpServers = '127.0.0.1' ,
  $iburst_enable = true,
  ) {

  package { 'ntp':
  ensure => installed,
  }

  file { 'ntp_config_file':
    ensure  => file,
    path    => '/etc/ntp.conf',
#    source  => 'puppet:///modules/ntp/ntp.conf',
    content => template('ntp/ntp.erb'),
    require => Package['ntp'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['ntpd'],
  }

  service { 'ntpd':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
