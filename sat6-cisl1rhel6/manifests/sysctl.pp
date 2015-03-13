# = Class: cisl1rhel6::sysctl
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
class cisl1rhel6::sysctl (

  $cis_1_6_1_enabled    = $cisl1rhel6::params::cis_1_6_1_enabled,
  $cis_1_6_2_enabled    = $cisl1rhel6::params::cis_1_6_2_enabled,
  $cis_1_6_3_enabled    = $cisl1rhel6::params::cis_1_6_3_enabled,
  $cis_4_1_1_enabled    = $cisl1rhel6::params::cis_4_1_1_enabled,
  $cis_4_1_2_enabled    = $cisl1rhel6::params::cis_4_1_2_enabled,
  $cis_4_2_1_enabled    = $cisl1rhel6::params::cis_4_2_1_enabled,
  $cis_4_2_2_enabled    = $cisl1rhel6::params::cis_4_2_2_enabled,
  $cis_4_2_3_enabled    = $cisl1rhel6::params::cis_4_2_3_enabled,
  $cis_4_2_4_enabled    = $cisl1rhel6::params::cis_4_2_4_enabled,
  $cis_4_2_5_enabled    = $cisl1rhel6::params::cis_4_2_5_enabled,
  $cis_4_2_6_enabled    = $cisl1rhel6::params::cis_4_2_6_enabled,
  $cis_4_2_8_enabled    = $cisl1rhel6::params::cis_4_2_8_enabled

) inherits cisl1rhel6::params {

  notify{"[sysctl] cis_1_6_1_enabled  = '${cis_1_6_1_enabled}'": }
  notify{"[sysctl] cis_1_6_2_enabled  = '${cis_1_6_2_enabled}'": }
  notify{"[sysctl] cis_1_6_3_enabled  = '${cis_1_6_3_enabled}'": }
  notify{"[sysctl] cis_4_1_1_enabled  = '${cis_4_1_1_enabled}'": }
  notify{"[sysctl] cis_4_1_2_enabled  = '${cis_4_1_2_enabled}'": }
  notify{"[sysctl] cis_4_2_1_enabled  = '${cis_4_2_1_enabled}'": }
  notify{"[sysctl] cis_4_2_2_enabled  = '${cis_4_2_2_enabled}'": }
  notify{"[sysctl] cis_4_2_3_enabled  = '${cis_4_2_3_enabled}'": }
  notify{"[sysctl] cis_4_2_4_enabled  = '${cis_4_2_4_enabled}'": }
  notify{"[sysctl] cis_4_2_5_enabled  = '${cis_4_2_5_enabled}'": }
  notify{"[sysctl] cis_4_2_6_enabled  = '${cis_4_2_6_enabled}'": }
  notify{"[sysctl] cis_4_2_8_enabled  = '${cis_4_2_8_enabled}'": }


  # CIS 1.6.1
  if $cis_1_6_1_enabled {

    augeas{'sysctl_core_dumps':
      context => '/files/etc/sysctl.conf',
      changes => [ 'set fs.suid_dumpable 0']
    }
  }

  # CIS 1.6.2
  if $cis_1_6_2_enabled {

    augeas { 'sysctl_exec_shield':
      context => '/files/etc/sysctl.conf',
      changes => ['set kernel.exec-shield 1']
    }
  }

  # CIS 1.6.3
  if $cis_1_6_3_enabled {

    augeas {'sysctl_randomized_virt_mem':
      context => '/files/etc/sysctl.conf',
      changes => ['set kernel.randomize_va_space 1']
    }
  }


  # CIS 4.1.1
  if $cis_4_1_1_enabled {

    augeas {'sysctl_disable_ip_forwarding':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.ip_forward 0',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.1.2
  if $cis_4_1_2_enabled {

    augeas {'sysctl_disable_network_send_redirects':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.conf.all.send_redirects 0',
                  'set net.ipv4.conf.default.send_redirects 0',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.2.1
  if $cis_4_2_1_enabled {

    augeas {'sysctl_disable_source_routed_packet_acceptance':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.conf.all.accept_source_route 0',
                  'set net.ipv4.conf.default.accept_source_route 0',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.2.2
  if $cis_4_2_2_enabled {

    augeas {'sysctl_disable_network_accept_redirects':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.conf.all.accept_redirects 0',
                  'set net.ipv4.conf.default.accept_redirects 0',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.2.3
  if $cis_4_2_3_enabled {

    augeas {'sysctl_secure_network_redirects':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.conf.all.secure_redirects 0',
                  'set net.ipv4.conf.default.secure_redirects 0',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.2.4
  if $cis_4_2_4_enabled {

    augeas {'sysctl_log_suspicious_packets':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.conf.all.log_martians 1',
                  'set net.ipv4.conf.default.log_martians 1',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.2.5
  if $cis_4_2_5_enabled {

    augeas {'sysctl_ignore_broadcast_requests':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.icmp_echo_ignore_broadcasts 1',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.2.6
  if $cis_4_2_6_enabled {

    augeas {'sysctl_ignore_bad_error_messages':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.icmp_ignore_bogus_error_responses 1',
                  'set net.ipv4.route.flush 1'],
    }
  }

  # CIS 4.2.8
  if $cis_4_2_8_enabled {

    augeas {'sysctl_enable_tcp_syn_cookies':
      context => '/files/etc/sysctl.conf',
      changes => ['set net.ipv4.tcp_syncookies 1',
                  'set net.ipv4.route.flush 1'],
    }
  }

}
