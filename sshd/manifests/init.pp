class sshd (
              $ciphers = 'aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,arcfour',
              $macs    = 'hmac-sha2-512,hmac-sha2-256,hmac-sha1,hmac-ripemd160',
) {

  service { 'sshd':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      "set Ciphers '${ciphers}'",
      "set Macs ${macs}"
      ],
    notify  => Service['sshd'],
  }
}

