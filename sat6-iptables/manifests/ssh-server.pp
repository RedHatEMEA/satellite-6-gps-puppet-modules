# == Class: iptables::ssh-server
#
# Class to allow incomming connnections to SSH port
#
class iptables::ssh-server {
  firewall { '100 allow all ssh access':
    port   => 22,
    proto  => tcp,
    action => accept,
  }
}
