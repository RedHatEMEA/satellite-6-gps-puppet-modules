# = Class: cisl1rhel6::iptables
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
class cisl1rhel6::iptables (

  $cis_4_7_enabled    = $cisl1rhel6::params::cis_4_7_enabled

) inherits cisl1rhel6::params {

  notify{"[iptables] cis_4_7_enabled  = '${cis_4_7_enabled}'": }


  # CIS 4.7
  if $cis_4_7_enabled {

    service { "iptables":
      ensure  => "running",
      enable  => "true",
    }

    file { "iptables_conf":
      ensure      => present,
      path        => '/etc/sysconfig/iptables.conf',
      source      => 'puppet:///modules/cisl1rhel6/iptables.conf',
      owner       => root,
      group       => root,
      mode        => 0600,
      notify      => Exec["iptables_load"],
    }

    exec { "iptables_load":
      command     => "/sbin/iptables-restore < /etc/sysconfig/iptables.conf ; /sbin/service iptables save",
      refreshonly => true,
      require     => File["iptables_conf"],
      notify      => Service["iptables"],
    }
  }

}
