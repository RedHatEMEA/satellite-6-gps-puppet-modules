# == Class: iptables::pre
#
# Class to create default rules before other roles are applied.
# Other sanity checks can be done here like blocking martians.
#
class iptables::pre {
  Firewall {
    require => undef,
  }

  # Default firewall rules
  firewall { '000 Accept incoming traffic from loopback':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '001 Accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }->
  firewall { '002 Reject local traffic not on loopback interface':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }->
  firewall { '003 Accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }
}
