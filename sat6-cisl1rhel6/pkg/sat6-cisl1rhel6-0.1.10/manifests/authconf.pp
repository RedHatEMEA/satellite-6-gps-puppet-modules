# = Class: cisl1rhel6::authconf
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
class cisl1rhel6::authconf (

  $cis_6_3_1_enabled  = $cisl1rhel6::params::cis_6_3_1_enabled,
  $cis_6_3_2_enabled  = $cisl1rhel6::params::cis_6_3_2_enabled,
  $cis_6_3_3_enabled  = $cisl1rhel6::params::cis_6_3_3_enabled,
  $cis_6_3_4_enabled  = $cisl1rhel6::params::cis_6_3_4_enabled,
  $cis_6_4_enabled    = $cisl1rhel6::params::cis_6_4_enabled,
  $cis_6_5_enabled    = $cisl1rhel6::params::cis_6_5_enabled,
  $cis_7_1_1_enabled  = $cisl1rhel6::params::cis_7_1_1_enabled,
  $cis_7_1_2_enabled  = $cisl1rhel6::params::cis_7_1_2_enabled,
  $cis_7_1_3_enabled  = $cisl1rhel6::params::cis_7_1_3_enabled,
  $cis_7_2_enabled    = $cisl1rhel6::params::cis_7_2_enabled,
  $cis_7_3_enabled    = $cisl1rhel6::params::cis_7_3_enabled,
  $cis_7_4_enabled    = $cisl1rhel6::params::cis_7_4_enabled,
  $cis_8_1_enabled    = $cisl1rhel6::params::cis_8_1_enabled,
  $cis_9_1_2_enabled  = $cisl1rhel6::params::cis_9_1_2_enabled,
  $cis_9_1_3_enabled  = $cisl1rhel6::params::cis_9_1_3_enabled,
  $cis_9_1_4_enabled  = $cisl1rhel6::params::cis_9_1_4_enabled,
  $cis_9_1_5_enabled  = $cisl1rhel6::params::cis_9_1_5_enabled,
  $cis_9_1_6_enabled  = $cisl1rhel6::params::cis_9_1_6_enabled,
  $cis_9_1_7_enabled  = $cisl1rhel6::params::cis_9_1_7_enabled,
  $cis_9_1_8_enabled  = $cisl1rhel6::params::cis_9_1_8_enabled,
  $cis_9_1_9_enabled  = $cisl1rhel6::params::cis_9_1_9_enabled

) inherits cisl1rhel6::params {

  notify{"[authconf] cis_6_3_1_enabled   = '${cis_6_3_1_enabled}'": }
  notify{"[authconf] cis_6_3_2_enabled   = '${cis_6_3_2_enabled}'": }
  notify{"[authconf] cis_6_3_3_enabled   = '${cis_6_3_3_enabled}'": }
  notify{"[authconf] cis_6_3_4_enabled   = '${cis_6_3_4_enabled}'": }
  notify{"[authconf] cis_6_4_enabled     = '${cis_6_4_enabled}'": }
  notify{"[authconf] cis_6_5_enabled     = '${cis_6_5_enabled}'": }
  notify{"[authconf] cis_7_1_1_enabled   = '${cis_7_1_1_enabled}'": }
  notify{"[authconf] cis_7_1_2_enabled   = '${cis_7_1_2_enabled}'": }
  notify{"[authconf] cis_7_1_3_enabled   = '${cis_7_1_3_enabled}'": }
  notify{"[authconf] cis_7_2_enabled     = '${cis_7_2_enabled}'": }
  notify{"[authconf] cis_7_3_enabled     = '${cis_7_3_enabled}'": }
  notify{"[authconf] cis_7_4_enabled     = '${cis_7_4_enabled}'": }
  notify{"[authconf] cis_8_1_enabled     = '${cis_8_1_enabled}'": }
  notify{"[authconf] cis_9_1_2_enabled   = '${cis_9_1_2_enabled}'": }
  notify{"[authconf] cis_9_1_3_enabled   = '${cis_9_1_3_enabled}'": }
  notify{"[authconf] cis_9_1_4_enabled   = '${cis_9_1_4_enabled}'": }
  notify{"[authconf] cis_9_1_5_enabled   = '${cis_9_1_5_enabled}'": }
  notify{"[authconf] cis_9_1_6_enabled   = '${cis_9_1_6_enabled}'": }
  notify{"[authconf] cis_9_1_7_enabled   = '${cis_9_1_7_enabled}'": }
  notify{"[authconf] cis_9_1_8_enabled   = '${cis_9_1_8_enabled}'": }
  notify{"[authconf] cis_9_1_9_enabled   = '${cis_9_1_9_enabled}'": }


  # CIS 6.3.1
  if $cis_6_3_1_enabled {

    exec { "run_account_purger_exec":
      command => "/usr/sbin/authconfig --passalgo=sha512 --update",
      onlyif => ["authconfig --test | grep hashing | grep -c sha512"],
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin'],
    }
  }

  # CIS 6.3.2, 6.3.3, 6.3.4
  if $cis_6_3_2_enabled and $cis_6_3_3_enabled and $cis_6_3_4_enabled {

    file { 'pam_system_auth_file':
      ensure  => file,
      path    => '/etc/pam.d/system-auth-ac',
      source  => 'puppet:///modules/cisl1rhel6/pamd_system-auth-ac',
      owner   => root,
      group   => root,
      mode    => '0644',
    }
  }

  # CIS 6.4
  if $cis_6_4_enabled {

    file { 'etc_securetty_file':
      ensure  => file,
      path    => '/etc/securetty',
      source  => 'puppet:///modules/cisl1rhel6/securetty',
      owner   => root,
      group   => root,
      mode    => '0600',
    }
  }

  # 6.5    /etc/pam.d/su restrict access to su command: wheel user list
  if $cis_6_5_enabled {

    file { 'pam_su_file':
      ensure  => file,
      path    => '/etc/pam.d/su',
      source  => 'puppet:///modules/cisl1rhel6/pamd_su',
      owner   => root,
      group   => root,
      mode    => '0644',
    }
  }

  # CIS 7.1.1, 7.1.2, 7.1.3
  if $cis_7_1_1_enabled and $cis_7_1_2_enabled and $cis_7_1_3_enabled {

    file { 'etc_login_defs_file':
      ensure  => file,
      path    => '/etc/login.defs',
      source  => 'puppet:///modules/cisl1rhel6/login.defs',
      owner   => root,
      group   => root,
      mode    => '0644',
    }
  }

  # CIS 7.2
  if $cis_7_2_enabled {

    exec {'run_set_admin_accounts_nologin_exec':
      onlyif => '/bin/bash /root/set_admin_accounts_nologin_onlyif.bash',
      command => '/bin/bash /root/set_admin_accounts_nologin_exec.bash',
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin','/root'],
      require => File['set_admin_accounts_nologin_exec_file',
                      'set_admin_accounts_nologin_onlyif_file'],
    }

   file { 'set_admin_accounts_nologin_exec_file':
      ensure  => file,
      path    => '/root/set_admin_accounts_nologin_exec.bash',
      source  => 'puppet:///modules/cisl1rhel6/set_admin_accounts_nologin_exec.bash',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
    }

   file { 'set_admin_accounts_nologin_onlyif_file':
      ensure  => file,
      path    => '/root/set_admin_accounts_nologin_onlyif.bash',
      source  => 'puppet:///modules/cisl1rhel6/set_admin_accounts_nologin_onlyif.bash',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
    }
  }

  # CIS 7.3
  if $cis_7_3_enabled {

    exec {'run_set_root_gid_zero_exec':
      onlyif  => '/bin/grep "^root:" /etc/passwd | /bin/cut -f4 -d: | /bin/grep -v 0',
      command => '/usr/sbin/usermod -g 0 root',
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin'],
    }
  }

  # CIS 7.4
  if $cis_7_4_enabled {

    augeas { 'umask_init':
      context => '/etc/bashrc',
      changes => 'set umask 077',
    }
  }

  # CIS 8.1
  if $cis_8_1_enabled {

    file { 'etc_issue_file':
      ensure  => present,
      path    => '/etc/issue',
      content => "Authorized uses only. All activity may be monitored and reported.\n",
      owner   => root,
      group   => root,
      mode    => 0644,
    }

    file { 'etc_issue-net_file':
      ensure  => present,
      path    => '/etc/issue.net',
      content => "Authorized uses only. All activity may be monitored and reported.\n",
      owner   => root,
      group   => root,
      mode    => 0644,
    }

    file { 'etc_motd_file':
      ensure  => present,
      path    => '/etc/motd',
      content => "Authorized uses only. All activity may be monitored and reported.\n",
      owner   => root,
      group   => root,
      mode    => 0644,
    }
  }

  # CIS 9.1.2, 9.1.6
  if $cis_9_1_2_enabled and $cis_9_1_6_enabled {

    file { 'etc_passwd_file':
      ensure  => present,
      path    => '/etc/passwd',
      owner   => root,
      group   => root,
      mode    => 0644,
    }
  }

  # CIS 9.1.3, 9.1.7
  if $cis_9_1_3_enabled and $cis_9_1_7_enabled {

    file { 'etc_shadow_file':
      ensure  => present,
      path    => '/etc/shadow',
      owner   => root,
      group   => root,
      mode    => 0000,
    }
  }

  # CIS 9.1.4, 9.1.8
  if $cis_9_1_4_enabled and $cis_9_1_8_enabled {

    file { 'etc_gshadow_file':
      ensure  => present,
      path    => '/etc/gshadow',
      owner   => root,
      group   => root,
      mode    => 0000,
    }
  }

  # CIS 9.1.5, 9.1.9
  if $cis_9_1_5_enabled and $cis_9_1_9_enabled {

    file { 'etc_group_file':
      ensure  => present,
      path    => '/etc/group',
      owner   => root,
      group   => root,
      mode    => 0644,
    }
  }

}
