class ntp (
  $iburst_enable = true,
  $server1       = '0.centos.pool.ntp.org',
  $server2       = '1.centos.pool.ntp.org',
  $server3       = '2.centos.pool.ntp.org',
  $server4       = '3.centos.pool.ntp.org',
) {

  service { 'ntpd':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  package { 'ntp':
    ensure => installed,
  }

  file { '/etc/ntp.conf':
    ensure  => file,
    path    => '/etc/ntp.conf',
    require => Package['ntp'],
    content => template('ntp/ntp.conf'),
    notify  => Service['ntpd'],
  }
}

