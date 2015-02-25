# == Class: iptables::post
#
# Class to apply default policy at the end of the chain
#
class iptables::post {
  # TODO: implement logging before applying default action

  firewall { '999 Apply policy':
    proto  => 'all',
    action => $::iptables::policy,
    before => undef,
  }
}
