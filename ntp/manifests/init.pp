class ntp (
  $iburst_enable = true,
  $ntpServers    = ["1.pool.ntp.org", "2.pool.ntp.org"],
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

