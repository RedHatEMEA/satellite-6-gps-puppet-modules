# = Class: cisl1rhel6::postfix
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
class cisl1rhel6::postfix (

  $cis_3_16_enabled = $cisl1rhel6::params::cis_3_16_enabled

) inherits cisl1rhel6::params {

  notify{"[postfix] cis_3_16_enabled   = '${cis_3_16_enabled}'": }


  # CIS 3.16
  if $cis_3_16_enabled {

    package { 'postfix':
      ensure => installed,
    }

    file { 'postfix_main_cf_file':
      ensure  => present,
      path    => '/etc/postfix/main.cf',
      source => 'puppet:///modules/cisl1rhel6/postfix_main_cf',
      owner   => root,
      group   => root,
      mode    => '0644',
      notify  => Service['postfix'],
    }

    service { 'postfix':
      enable => true,
      ensure => running,
    }
  }

}
