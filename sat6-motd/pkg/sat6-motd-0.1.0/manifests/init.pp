# == Class: motd
#
# Simple motd class that is free standing, ie doesn't use stdlib
#
# === Parameters
#
# Document parameters here.
#
# === Authors
#
# Author Name <cprocter@redhat.com>
#
# === Copyright
#
# Copyright 2015 Red Hat Ltd.
#
class ntp (
  ) {

  file { 'motd':
    ensure  => file,
    path    => '/etc/motd',
    content => template('motd/motd.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
