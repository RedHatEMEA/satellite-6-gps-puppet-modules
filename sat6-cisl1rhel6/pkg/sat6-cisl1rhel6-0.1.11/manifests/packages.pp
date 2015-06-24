# = Class: cisl1rhel6::packages
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
class cisl1rhel6::packages (

  $cis_2_1_1_enabled    = $cisl1rhel6::params::cis_2_1_1_enabled,
  $cis_2_1_2_enabled    = $cisl1rhel6::params::cis_2_1_2_enabled,
  $cis_2_1_3_enabled    = $cisl1rhel6::params::cis_2_1_3_enabled,
  $cis_2_1_4_enabled    = $cisl1rhel6::params::cis_2_1_4_enabled,
  $cis_2_1_5_enabled    = $cisl1rhel6::params::cis_2_1_5_enabled,
  $cis_2_1_6_enabled    = $cisl1rhel6::params::cis_2_1_6_enabled,
  $cis_2_1_7_enabled    = $cisl1rhel6::params::cis_2_1_7_enabled,
  $cis_2_1_8_enabled    = $cisl1rhel6::params::cis_2_1_8_enabled,
  $cis_2_1_9_enabled    = $cisl1rhel6::params::cis_2_1_9_enabled,
  $cis_2_1_10_enabled   = $cisl1rhel6::params::cis_2_1_10_enabled,
  $cis_2_1_11_enabled   = $cisl1rhel6::params::cis_2_1_11_enabled,
  $cis_2_1_12_enabled   = $cisl1rhel6::params::cis_2_1_12_enabled,
  $cis_2_1_13_enabled   = $cisl1rhel6::params::cis_2_1_13_enabled,
  $cis_2_1_14_enabled   = $cisl1rhel6::params::cis_2_1_14_enabled,
  $cis_2_1_15_enabled   = $cisl1rhel6::params::cis_2_1_15_enabled,
  $cis_2_1_16_enabled   = $cisl1rhel6::params::cis_2_1_16_enabled,
  $cis_2_1_17_enabled   = $cisl1rhel6::params::cis_2_1_17_enabled,
  $cis_2_1_18_enabled   = $cisl1rhel6::params::cis_2_1_18_enabled,
  $cis_3_5_enabled      = $cisl1rhel6::params::cis_3_5_enabled,
  $cis_3_7_enabled      = $cisl1rhel6::params::cis_3_7_enabled,
  $cis_3_9_enabled      = $cisl1rhel6::params::cis_3_9_enabled,
  $cis_3_10_enabled     = $cisl1rhel6::params::cis_3_10_enabled,
  $cis_3_11_enabled     = $cisl1rhel6::params::cis_3_11_enabled,
  $cis_3_12_enabled     = $cisl1rhel6::params::cis_3_12_enabled,
  $cis_3_13_enabled     = $cisl1rhel6::params::cis_3_13_enabled,
  $cis_3_14_enabled     = $cisl1rhel6::params::cis_3_14_enabled,
  $cis_3_15_enabled     = $cisl1rhel6::params::cis_3_15_enabled,
  $cis_4_5_1_enabled    = $cisl1rhel6::params::cis_4_5_1_enabled

) inherits cisl1rhel6::params {

  notify{"[packages] cis_2_1_1_enabled   = '${cis_2_1_1_enabled}'": }
  notify{"[packages] cis_2_1_2_enabled   = '${cis_2_1_2_enabled}'": }
  notify{"[packages] cis_2_1_3_enabled   = '${cis_2_1_3_enabled}'": }
  notify{"[packages] cis_2_1_4_enabled   = '${cis_2_1_4_enabled}'": }
  notify{"[packages] cis_2_1_5_enabled   = '${cis_2_1_5_enabled}'": }
  notify{"[packages] cis_2_1_6_enabled   = '${cis_2_1_6_enabled}'": }
  notify{"[packages] cis_2_1_7_enabled   = '${cis_2_1_7_enabled}'": }
  notify{"[packages] cis_2_1_8_enabled   = '${cis_2_1_8_enabled}'": }
  notify{"[packages] cis_2_1_9_enabled   = '${cis_2_1_9_enabled}'": }
  notify{"[packages] cis_2_1_10_enabled  = '${cis_2_1_10_enabled}'": }
  notify{"[packages] cis_2_1_11_enabled  = '${cis_2_1_11_enabled}'": }
  notify{"[packages] cis_2_1_12_enabled  = '${cis_2_1_12_enabled}'": }
  notify{"[packages] cis_2_1_13_enabled  = '${cis_2_1_13_enabled}'": }
  notify{"[packages] cis_2_1_14_enabled  = '${cis_2_1_14_enabled}'": }
  notify{"[packages] cis_2_1_15_enabled  = '${cis_2_1_15_enabled}'": }
  notify{"[packages] cis_2_1_16_enabled  = '${cis_2_1_16_enabled}'": }
  notify{"[packages] cis_2_1_17_enabled  = '${cis_2_1_17_enabled}'": }
  notify{"[packages] cis_2_1_18_enabled  = '${cis_2_1_18_enabled}'": }
  notify{"[packages] cis_3_5_enabled     = '${cis_3_5_enabled}'": }
  notify{"[packages] cis_3_7_enabled     = '${cis_3_7_enabled}'": }
  notify{"[packages] cis_3_9_enabled     = '${cis_3_9_enabled}'": }
  notify{"[packages] cis_3_10_enabled    = '${cis_3_10_enabled}'": }
  notify{"[packages] cis_3_11_enabled    = '${cis_3_11_enabled}'": }
  notify{"[packages] cis_3_12_enabled    = '${cis_3_12_enabled}'": }
  notify{"[packages] cis_3_13_enabled    = '${cis_3_13_enabled}'": }
  notify{"[packages] cis_3_14_enabled    = '${cis_3_14_enabled}'": }
  notify{"[packages] cis_3_15_enabled    = '${cis_3_15_enabled}'": }
  notify{"[packages] cis_4_5_1_enabled   = '${cis_4_5_1_enabled}'": }

  ########################################################
  # Removed
  ########################################################

  # CIS 2.1.1
  if $cis_2_1_1_enabled {

    package { 'telnet-server':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.2
  if $cis_2_1_2_enabled {

    package { 'telnet':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.3
  if $cis_2_1_3_enabled {

    package { 'rsh-server':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.4
  if $cis_2_1_4_enabled {

    package { 'rsh':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.5
  if $cis_2_1_5_enabled {

    package { 'ypbind':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.6
  if $cis_2_1_6_enabled {

    package { 'ypserv':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.7
  if $cis_2_1_7_enabled {

    package { 'tftp':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.8
  if $cis_2_1_8_enabled {

    package { 'tftp-server':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.9
  if $cis_2_1_9_enabled {

    package { 'talk':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.10
  if $cis_2_1_10_enabled {

    package { 'talk-server':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.11
  if $cis_2_1_11_enabled {

    package { 'xinetd':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.12
  if $cis_2_1_12_enabled {

    package { 'chargen-dgram':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.13
  if $cis_2_1_13_enabled {

    package { 'chargen-stream':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.14
  if $cis_2_1_14_enabled {

    package { 'daytime-dgram':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.15
  if $cis_2_1_15_enabled {

    package { 'daytime-stream':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.16
  if $cis_2_1_16_enabled {

    package { 'echo-dgram':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.17
  if $cis_2_1_17_enabled {

    package { 'echo-stream':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 2.1.18
  if $cis_2_1_18_enabled {

    package { 'tcpmux-server':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.5
  if $cis_3_5_enabled {

    package { 'dhcp':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.7
  if $cis_3_7_enabled {

    $package_list=['openldap-servers','openldap-clients']
    package { $package_list:
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.9
  if $cis_3_9_enabled {

    package { 'bind':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.10
  if $cis_3_10_enabled {

    package { 'vsftpd':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.11
  if $cis_3_11_enabled {

    package { 'httpd':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.12
  if $cis_3_12_enabled {

    package { 'dovecot':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.13
  if $cis_3_13_enabled {

    package { 'samba':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.14
  if $cis_3_14_enabled {

    package { 'squid':
      ensure  => purged,
     provider => 'yum',
    }
  }

  # CIS 3.15
  if $cis_3_15_enabled {

    package { 'net-snmp':
      ensure  => purged,
     provider => 'yum',
    }
  }


  ########################################################
  # Installed
  ########################################################

  # 4.5.1  TCP Wrappers tcp_wrappers installed
  if $cis_4_5_1_enabled {

    package{ 'tcp_wrappers':
      ensure => installed,
    }
  }

}
