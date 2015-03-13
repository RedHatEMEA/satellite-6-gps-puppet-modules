# = Class: cisl1rhel6::limits
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
class cisl1rhel6::limits (

  $cis_1_6_1_enabled    = $cisl1rhel6::params::cis_1_6_1_enabled

) inherits cisl1rhel6::params {

  notify{"[limits] cis_1_6_1_enabled  = '${cis_1_6_1_enabled}'": }

  # CIS 1.6.1
  if $cis_1_6_1_enabled {

    exec {'security_core_dump':
      onlyif  => '/bin/grep -qc \'\* \+hard \+core \+0\' /etc/security/limits.conf ; echo $?',
      command => '/bin/sed -i \'$ a\* hard core 0\' /etc/security/limits.conf',
      path    => ['/bin','/sbin','/usr/bin/','/usr/sbin']
    }
  }

}
