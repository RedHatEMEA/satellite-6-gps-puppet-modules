# = Class: cisl1rhel6::noipv6
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
class cisl1rhel6::noipv6 (

  $cis_4_4_2_enabled    = $cisl1rhel6::params::cis_4_4_2_enabled

) inherits cisl1rhel6::params {

  notify{"[noipv6] cis_4_4_2_enabled  = '${cis_4_4_2_enabled}'": }


  # CIS 4.4.2
  if $cis_4_4_2_enabled {

    augeas { 'modprobe_noipv6':
      context => '/files/etc/modprobe.conf',
      changes => ['set options[.="ipv6"] "ipv6"',
                  'set options[.= "ipv6"]/disable 1' ]
    }

    augeas { 'modprobe_d_noipv6':
      context => '/files/etc/modprobe.d/ipv6.conf',
      changes => ['set options[.="ipv6"] "ipv6"',
                  'set options[.= "ipv6"]/disable 1' ]
    }

    augeas { 'ifcfg_eth0_noipv6':
      context => '/files/etc/sysconfig/network-scripts/ifcfg-eth0',
      changes => [ 'set NETWORKING_IPV6 no',
                   'set IPV6INIT no' ],
    }
  }

}
