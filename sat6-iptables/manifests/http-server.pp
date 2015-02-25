# == Class: iptables::http-server
#
# Class to allow incomming connections to HTTP/HTTPS ports
#
class iptables::http-server {
  firewall { '100 allow http and https access':
    port   => [ 80, 443 ],
    proto  => tcp,
    action => accept,
  }
}
