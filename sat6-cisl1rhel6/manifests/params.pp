# == Class: cisl1rhel6::params
#
# === Authors
#
# Author Name <ghares@redhat.com>
#
# === Copyright
#
# Copyright 2015 Red Hat Inc, unless otherwise noted.
#
class cisl1rhel6::params (

  $cis_1_1_2_enabled      = true,
  $cis_1_1_3_enabled      = true,
  $cis_1_1_4_enabled      = true,
  $cis_1_1_6_enabled      = true,
  $cis_1_1_10_enabled     = true,
  $cis_1_1_14_enabled     = true,
  $cis_1_1_15_enabled     = true,
  $cis_1_1_16_enabled     = true,
  $cis_1_5_1_enabled      = true,
  $cis_1_5_2_enabled      = true,
  $cis_1_5_3_enabled      = false, # grub boot loader password
  $cis_1_5_4_enabled      = true,
  $cis_1_5_5_enabled      = false, # interactive boot disabled
  $cis_1_6_1_enabled      = true,
  $cis_1_6_2_enabled      = true,
  $cis_1_6_3_enabled      = true,
  $cis_2_1_1_enabled      = true,
  $cis_2_1_2_enabled      = true,
  $cis_2_1_3_enabled      = true,
  $cis_2_1_4_enabled      = true,
  $cis_2_1_5_enabled      = true,
  $cis_2_1_6_enabled      = true,
  $cis_2_1_7_enabled      = true,
  $cis_2_1_8_enabled      = true,
  $cis_2_1_9_enabled      = true,
  $cis_2_1_10_enabled     = true,
  $cis_2_1_11_enabled     = false, # xinetd services disabled
  $cis_2_1_12_enabled     = true,
  $cis_2_1_13_enabled     = true,
  $cis_2_1_14_enabled     = true,
  $cis_2_1_15_enabled     = true,
  $cis_2_1_16_enabled     = true,
  $cis_2_1_17_enabled     = true,
  $cis_2_1_18_enabled     = true,
  $cis_3_1_enabled        = true,
  $cis_3_2_enabled        = false, # remove X-Windows
  $cis_3_3_enabled        = true,
  $cis_3_4_enabled        = true,
  $cis_3_5_enabled        = true,
  $cis_3_6_enabled        = true,
  $cis_3_7_enabled        = true,
  $cis_3_8_enabled        = true,
  $cis_3_9_enabled        = true,
  $cis_3_10_enabled       = true,
  $cis_3_11_enabled       = true,
  $cis_3_12_enabled       = true,
  $cis_3_13_enabled       = true,
  $cis_3_14_enabled       = true,
  $cis_3_15_enabled       = true,
  $cis_3_16_enabled       = true,
  $cis_4_1_1_enabled      = true,
  $cis_4_1_2_enabled      = true,
  $cis_4_2_1_enabled      = true,
  $cis_4_2_2_enabled      = true,
  $cis_4_2_3_enabled      = true,
  $cis_4_2_4_enabled      = true,
  $cis_4_2_5_enabled      = true,
  $cis_4_2_6_enabled      = true,
  $cis_4_2_8_enabled      = true,
  $cis_4_4_2_enabled      = true,
  $cis_4_5_1_enabled      = true,
  $cis_4_5_2_enabled      = true,
  $cis_4_5_3_enabled      = true,
  $cis_4_5_4_enabled      = false, # blocks ssh access if host not in hosts.allow
  $cis_4_5_5_enabled      = false, # blocks ssh access if host not in hosts.allow
  $cis_4_6_1_enabled      = true,
  $cis_4_6_2_enabled      = true,
  $cis_4_6_3_enabled      = true,
  $cis_4_6_4_enabled      = false, # blocks root access to all tty consoles
  $cis_4_7_enabled        = true,
  $cis_5_1_1_enabled      = true,
  $cis_5_1_2_enabled      = true,
  $cis_5_1_3_enabled      = true,
  $cis_5_3_enabled        = true,
  $cis_6_1_1_enabled      = true,
  $cis_6_1_2_enabled      = true,
  $cis_6_1_3_enabled      = true,
  $cis_6_1_4_enabled      = true,
  $cis_6_1_5_enabled      = true,
  $cis_6_1_6_enabled      = true,
  $cis_6_1_7_enabled      = true,
  $cis_6_1_8_enabled      = true,
  $cis_6_1_9_enabled      = true,
  $cis_6_1_10_enabled     = true,
  $cis_6_1_11_enabled     = false, # cron.allow and at.allow need users param
  $cis_6_2_1_enabled      = true,
  $cis_6_2_2_enabled      = true,
  $cis_6_2_3_enabled      = true,
  $cis_6_2_4_enabled      = true,
  $cis_6_2_5_enabled      = true,
  $cis_6_2_6_enabled      = true,
  $cis_6_2_7_enabled      = true,
  $cis_6_2_8_enabled      = false, # disable root ssh access
  $cis_6_2_9_enabled      = true,
  $cis_6_2_10_enabled     = true,
  $cis_6_2_11_enabled     = true,
  $cis_6_2_12_enabled     = true,
  $cis_6_2_14_enabled     = true,
  $cis_6_3_1_enabled      = true,
  $cis_6_3_2_enabled      = true,
  $cis_6_3_3_enabled      = true,
  $cis_6_3_4_enabled      = true,
  $cis_6_4_enabled        = false, # disable consoles
  $cis_6_5_enabled        = false, # restrict su access to wheel user list
  $cis_7_1_1_enabled      = true,
  $cis_7_1_2_enabled      = true,
  $cis_7_1_3_enabled      = true,
  $cis_7_2_enabled        = true,
  $cis_7_3_enabled        = true,
  $cis_7_4_enabled        = true,
  $cis_8_1_enabled        = true,
  $cis_9_1_2_enabled      = true,
  $cis_9_1_3_enabled      = true,
  $cis_9_1_4_enabled      = true,
  $cis_9_1_5_enabled      = true,
  $cis_9_1_6_enabled      = true,
  $cis_9_1_7_enabled      = true,
  $cis_9_1_8_enabled      = true,
  $cis_9_1_9_enabled      = true,
  $cis_md5_grub_password  = '$1$LtwV7$STi40hx/AZvfMbI9sfjZY/',
  $cis_ntp_servers        = '127.0.0.1'

) {

  validate_bool($cis_1_1_2_enabled)
  validate_bool($cis_1_1_3_enabled)
  validate_bool($cis_1_1_4_enabled)
  validate_bool($cis_1_1_6_enabled)
  validate_bool($cis_1_1_10_enabled)
  validate_bool($cis_1_1_14_enabled)
  validate_bool($cis_1_1_15_enabled)
  validate_bool($cis_1_1_16_enabled)
  validate_bool($cis_1_5_1_enabled)
  validate_bool($cis_1_5_2_enabled)
  validate_bool($cis_1_5_3_enabled)
  validate_bool($cis_1_5_4_enabled)
  validate_bool($cis_1_5_5_enabled)
  validate_bool($cis_1_6_1_enabled)
  validate_bool($cis_1_6_2_enabled)
  validate_bool($cis_1_6_3_enabled)
  validate_bool($cis_2_1_1_enabled)
  validate_bool($cis_2_1_2_enabled)
  validate_bool($cis_2_1_3_enabled)
  validate_bool($cis_2_1_4_enabled)
  validate_bool($cis_2_1_5_enabled)
  validate_bool($cis_2_1_6_enabled)
  validate_bool($cis_2_1_7_enabled)
  validate_bool($cis_2_1_8_enabled)
  validate_bool($cis_2_1_9_enabled)
  validate_bool($cis_2_1_10_enabled)
  validate_bool($cis_2_1_11_enabled)
  validate_bool($cis_2_1_12_enabled)
  validate_bool($cis_2_1_13_enabled)
  validate_bool($cis_2_1_14_enabled)
  validate_bool($cis_2_1_15_enabled)
  validate_bool($cis_2_1_16_enabled)
  validate_bool($cis_2_1_17_enabled)
  validate_bool($cis_2_1_18_enabled)
  validate_bool($cis_3_1_enabled)
  validate_bool($cis_3_2_enabled)
  validate_bool($cis_3_3_enabled)
  validate_bool($cis_3_4_enabled)
  validate_bool($cis_3_5_enabled)
  validate_bool($cis_3_6_enabled)
  validate_bool($cis_3_7_enabled)
  validate_bool($cis_3_8_enabled)
  validate_bool($cis_3_9_enabled)
  validate_bool($cis_3_10_enabled)
  validate_bool($cis_3_11_enabled)
  validate_bool($cis_3_12_enabled)
  validate_bool($cis_3_13_enabled)
  validate_bool($cis_3_14_enabled)
  validate_bool($cis_3_15_enabled)
  validate_bool($cis_3_16_enabled)
  validate_bool($cis_4_1_1_enabled)
  validate_bool($cis_4_1_2_enabled)
  validate_bool($cis_4_2_1_enabled)
  validate_bool($cis_4_2_2_enabled)
  validate_bool($cis_4_2_3_enabled)
  validate_bool($cis_4_2_4_enabled)
  validate_bool($cis_4_2_5_enabled)
  validate_bool($cis_4_2_6_enabled)
  validate_bool($cis_4_2_8_enabled)
  validate_bool($cis_4_4_2_enabled)
  validate_bool($cis_4_5_1_enabled)
  validate_bool($cis_4_5_2_enabled)
  validate_bool($cis_4_5_3_enabled)
  validate_bool($cis_4_5_4_enabled)
  validate_bool($cis_4_5_5_enabled)
  validate_bool($cis_4_6_1_enabled)
  validate_bool($cis_4_6_2_enabled)
  validate_bool($cis_4_6_3_enabled)
  validate_bool($cis_4_6_4_enabled)
  validate_bool($cis_4_7_enabled)
  validate_bool($cis_5_1_1_enabled)
  validate_bool($cis_5_1_2_enabled)
  validate_bool($cis_5_1_3_enabled)
  validate_bool($cis_5_3_enabled)
  validate_bool($cis_6_1_1_enabled)
  validate_bool($cis_6_1_2_enabled)
  validate_bool($cis_6_1_3_enabled)
  validate_bool($cis_6_1_4_enabled)
  validate_bool($cis_6_1_5_enabled)
  validate_bool($cis_6_1_6_enabled)
  validate_bool($cis_6_1_7_enabled)
  validate_bool($cis_6_1_8_enabled)
  validate_bool($cis_6_1_9_enabled)
  validate_bool($cis_6_1_10_enabled)
  validate_bool($cis_6_1_11_enabled)
  validate_bool($cis_6_2_1_enabled)
  validate_bool($cis_6_2_2_enabled)
  validate_bool($cis_6_2_3_enabled)
  validate_bool($cis_6_2_4_enabled)
  validate_bool($cis_6_2_5_enabled)
  validate_bool($cis_6_2_6_enabled)
  validate_bool($cis_6_2_7_enabled)
  validate_bool($cis_6_2_8_enabled)
  validate_bool($cis_6_2_9_enabled)
  validate_bool($cis_6_2_10_enabled)
  validate_bool($cis_6_2_11_enabled)
  validate_bool($cis_6_2_12_enabled)
  validate_bool($cis_6_2_14_enabled)
  validate_bool($cis_6_3_1_enabled)
  validate_bool($cis_6_3_2_enabled)
  validate_bool($cis_6_3_3_enabled)
  validate_bool($cis_6_3_4_enabled)
  validate_bool($cis_6_4_enabled)
  validate_bool($cis_6_5_enabled)
  validate_bool($cis_7_1_1_enabled)
  validate_bool($cis_7_1_2_enabled)
  validate_bool($cis_7_1_3_enabled)
  validate_bool($cis_7_3_enabled)
  validate_bool($cis_7_4_enabled)
  validate_bool($cis_8_1_enabled)
  validate_bool($cis_9_1_2_enabled)
  validate_bool($cis_9_1_3_enabled)
  validate_bool($cis_9_1_4_enabled)
  validate_bool($cis_9_1_5_enabled)
  validate_bool($cis_9_1_6_enabled)
  validate_bool($cis_9_1_7_enabled)
  validate_bool($cis_9_1_8_enabled)
  validate_bool($cis_9_1_9_enabled)
  validate_string($cis_md5_grub_password)
  validate_string($cis_ntp_servers)

}
