# = Class: cisl1rhel6::sshdconf
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
class cisl1rhel6::sshdconf (

  $cis_6_2_1_enabled  = $cisl1rhel6::params::cis_6_2_1_enabled,
  $cis_6_2_2_enabled  = $cisl1rhel6::params::cis_6_2_2_enabled,
  $cis_6_2_3_enabled  = $cisl1rhel6::params::cis_6_2_3_enabled,
  $cis_6_2_4_enabled  = $cisl1rhel6::params::cis_6_2_4_enabled,
  $cis_6_2_5_enabled  = $cisl1rhel6::params::cis_6_2_5_enabled,
  $cis_6_2_6_enabled  = $cisl1rhel6::params::cis_6_2_6_enabled,
  $cis_6_2_7_enabled  = $cisl1rhel6::params::cis_6_2_7_enabled,
  $cis_6_2_8_enabled  = $cisl1rhel6::params::cis_6_2_8_enabled,
  $cis_6_2_9_enabled  = $cisl1rhel6::params::cis_6_2_9_enabled,
  $cis_6_2_10_enabled = $cisl1rhel6::params::cis_6_2_10_enabled,
  $cis_6_2_11_enabled = $cisl1rhel6::params::cis_6_2_11_enabled,
  $cis_6_2_12_enabled = $cisl1rhel6::params::cis_6_2_12_enabled,
  $cis_6_2_14_enabled = $cisl1rhel6::params::cis_6_2_14_enabled

) inherits cisl1rhel6::params {

  notify{"[sshdconf] 6_2_1_enabled   = '${cis_6_2_1_enabled}'": }
  notify{"[sshdconf] 6_2_2_enabled   = '${cis_6_2_2_enabled}'": }
  notify{"[sshdconf] 6_2_3_enabled   = '${cis_6_2_3_enabled}'": }
  notify{"[sshdconf] 6_2_4_enabled   = '${cis_6_2_4_enabled}'": }
  notify{"[sshdconf] 6_2_5_enabled   = '${cis_6_2_5_enabled}'": }
  notify{"[sshdconf] 6_2_6_enabled   = '${cis_6_2_6_enabled}'": }
  notify{"[sshdconf] 6_2_7_enabled   = '${cis_6_2_7_enabled}'": }
  notify{"[sshdconf] 6_2_8_enabled   = '${cis_6_2_8_enabled}'": }
  notify{"[sshdconf] 6_2_9_enabled   = '${cis_6_2_9_enabled}'": }
  notify{"[sshdconf] 6_2_10_enabled  = '${cis_6_2_10_enabled}'": }
  notify{"[sshdconf] 6_2_11_enabled  = '${cis_6_2_11_enabled}'": }
  notify{"[sshdconf] 6_2_12_enabled  = '${cis_6_2_12_enabled}'": }
  notify{"[sshdconf] 6_2_14_enabled  = '${cis_6_2_14_enabled}'": }


  # service running and
  # CIS 6.2.3
  package { 'openssh-server':
    ensure  => present,
  }

  file { 'sshd_config_file':
    ensure  => present,
    path    => '/etc/ssh/sshd_config',
    owner   => root,
    group   => root,
    mode    => 0600,
    require => Package['openssh-server'],

  }

  service { 'sshd':
    ensure  => running,
    enable  => true,
  }


  # CIS 6.2.1
  if $cis_6_2_1_enabled {

    augeas { 'sshd_config_sshproto':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set Protocol 2'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.2
  if $cis_6_2_2_enabled {

    augeas { 'sshd_config_loglevel':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set LogLevel INFO'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.4
  if $cis_6_2_4_enabled {

    augeas { 'sshd_config_x11forwarding':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set X11Forwarding no'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.5
  if $cis_6_2_5_enabled {

    augeas { 'sshd_config_maxauthtries':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set MaxAuthTries 4'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.6
  if $cis_6_2_6_enabled {

    augeas { 'sshd_config_ignorerhosts':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set IgnoreRhosts yes'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.7
  if $cis_6_2_7_enabled {

    augeas { 'sshd_config_hostbasedauth':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set HostbasedAuthentication no'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.8
  if $cis_6_2_8_enabled {

    augeas { 'sshd_config_rootlogin':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set PermitRootLogin no'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.9  sshd PermitEmptyPassword no
  if $cis_6_2_9_enabled {

    augeas { 'sshd_config_permemptypwd':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set PermitEmptyPasswords no'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.10
  if $cis_6_2_10_enabled {

    augeas { 'sshd_config_permituserenv':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set PermitUserEnvironment no'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.11
  if $cis_6_2_11_enabled {

    augeas { 'sshd_config_ciphers':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set Ciphers aes128-ctr,aes192-ctr,aes256-ctr'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.12
  if $cis_6_2_12_enabled {

    augeas { 'sshd_config_client_idle':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set ClientAliveInterval 300',
                  'set ClientAliveCountMax 0'],
      notify  => Service['sshd']
    }
  }

  # CIS 6.2.14
  if $cis_6_2_14_enabled {

    augeas { 'sshd_config_banner':
      context => '/files/etc/ssh/sshd_config',
      changes => ['set Banner /etc/issue.net'],
      notify  => Service['sshd']
    }
  }

# user sshd auth options:
#      changes => ['set GSSAPIAuthentication yes']
#      changes => ['set GSSAPICleanupCredentials yes']
#      changes => ['set ChallengeResponseAuthentication yes']

}
