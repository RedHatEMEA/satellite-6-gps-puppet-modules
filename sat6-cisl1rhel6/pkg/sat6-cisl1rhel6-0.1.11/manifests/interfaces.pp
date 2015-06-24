# = Class: cisl1rhel6::interfaces
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
class cisl1rhel6::interfaces (

  $cis_4_6_1_enabled    = $cisl1rhel6::params::cis_4_6_1_enabled,
  $cis_4_6_2_enabled    = $cisl1rhel6::params::cis_4_6_2_enabled,
  $cis_4_6_3_enabled    = $cisl1rhel6::params::cis_4_6_3_enabled,
  $cis_4_6_4_enabled    = $cisl1rhel6::params::cis_4_6_4_enabled

) inherits cisl1rhel6::params {

  notify{"[interfaces] cis_4_6_1_enabled  = '${cis_4_6_1_enabled}'": }
  notify{"[interfaces] cis_4_6_2_enabled  = '${cis_4_6_2_enabled}'": }
  notify{"[interfaces] cis_4_6_3_enabled  = '${cis_4_6_3_enabled}'": }
  notify{"[interfaces] cis_4_6_4_enabled  = '${cis_4_6_4_enabled}'": }


  file {'cis_interfaces_conf':
    ensure  => file,
    path    => '/etc/modprobe.d/cis-interfaces.conf',
    content => "# CIS Disable Interfaces\n",
    owner   => root,
    group   => root,
    mode    => '0644',
  }


  # CIS 4.6.1
  if $cis_4_6_1_enabled {

    exec {'disable_dccp_interface':
      onlyif  => '/bin/grep -c \'dccp\' /etc/modprobe.d/cis-interfaces.conf ; echo $?',
      command => '/bin/sed -i \'$ ainstall dccp /bin/true\' /etc/modprobe.d/cis-interfaces.conf',
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin'],
      require => File['cis_interfaces_conf'],
    }
  }

  # CIS 4.6.2
  if $cis_4_6_2_enabled {

    exec {'disable_sctp_interface':
      onlyif  => '/bin/grep -c \'sctp\' /etc/modprobe.d/cis-interfaces.conf ; echo $?',
      command => '/bin/sed -i \'$ ainstall sctp /bin/true\' /etc/modprobe.d/cis-interfaces.conf',
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin'],
      require => File['cis_interfaces_conf'],
    }
  }

  # CIS 4.6.3
  if $cis_4_6_3_enabled {

    exec {'disable_rds_interface':
      onlyif  => '/bin/grep -c \'rds\' /etc/modprobe.d/cis-interfaces.conf ; echo $?',
      command => '/bin/sed -i \'$ ainstall rds /bin/true\' /etc/modprobe.d/cis-interfaces.conf',
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin'],
      require => File['cis_interfaces_conf'],
    }
  }

  # CIS 4.6.4
  if $cis_4_6_4_enabled {

    exec {'disable_tipc_interface':
      onlyif  => '/bin/grep -c \'tipc\' /etc/modprobe.d/cis-interfaces.conf ; echo $?',
      command => '/bin/sed -i \'$ ainstall tipc /bin/true\' /etc/modprobe.d/cis-interfaces.conf',
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin'],
      require => File['cis_interfaces_conf'],
    }
  }

}
