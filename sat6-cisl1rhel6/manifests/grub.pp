# = Class: cisl1rhel6::grub
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
class cisl1rhel6::grub (

  $cis_1_5_2_enabled      = $cisl1rhel6::params::cis_1_5_2_enabled,
  $cis_1_5_3_enabled      = $cisl1rhel6::params::cis_1_5_3_enabled,
  $cis_md5_grub_password  = $cisl1rhel6::params::cis_md5_grub_password

) inherits cisl1rhel6::params {

  notify{"[grub] cis_1_5_2_enabled     = '${cis_1_5_2_enabled}'": }
  notify{"[grub] cis_1_5_3_enabled     = '${cis_1_5_3_enabled}'": }
  notify{"[grub] cis_md5_grub_password = '${cis_md5_grub_password}'": }


  # CIS 1.5.2
  if $cis_1_5_2_enabled {

    file {'/etc/grub.conf':
      owner => root,
      group => root,
      mode  => '0600',
    }

    file {'/boot/grub/grub.conf':
      owner => root,
      group => root,
      mode  => '0600',
    }
  }

  # CIS 1.5.3
  if $cis_1_5_3_enabled {

    augeas { 'grub-create-password':
      context => '/files/boot/grub/grub.conf',
      changes => [
        'ins password after default',
        "set password/md5 ''",
        "set password ${cis_md5_grub_password}",
      ],
      onlyif  => 'match password size == 0',
    }

    augeas { 'grub-set-password':
      context => '/files/boot/grub/grub.conf',
      changes => "set password ${cis_md5_grub_password}",
      require => Augeas['grub-create-password'],
    }
  }

}
