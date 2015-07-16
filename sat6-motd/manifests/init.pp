# == Class: motd
#
# Simple motd class that can be customised at wil
#
# === Parameters
#
# Document parameters here.
#
# None
#
# === Authors
#
# Author Name <cprocter@redhat.com>
#
# === Copyright
#
# Copyright 2015 Red Hat Ltd.
#
class motd (
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
