# == Class: iptables
#
# Class to install and configure iptables service in RHEL installations
#
# === Parameters
#
# [*enabled*]
#  Boolean. Defines service status at boottime
#  Valid options: true, false
#  Default: true
#
# [*policy*]
#  String. Defines the default policy to apply to unmatched traffic
#  Valid options: accept, reject, drop
#  Default: accept
#
# [*log*]
#  Boolean. Defines if unmatched traffic should be sent to log before 
#           applying default policy
#  Valid options: true, false
#  Default: false
#
# [*role*]
#  Array. Defines all included roles in the server. These must exist as classes.
#  Valid options: any class defined as role which uses puppetlabs-firewall module
#  Default: empty
#
# === Examples
#
#  class { iptables:
#       enabled => true,
#	policy  => 'reject',
#       role    => ['ssh-server'],
#  }
#
# === Authors
#
# Sergio Garcia <sgarcia@redhat.com>
#
class iptables (
  $enabled = true,
  $policy  = 'accept',
  $log     = false,
  $role    = [],
) {
  # TODO: better service management as it seems to stop the service
  #       before and then recreates the rules, which enables the 
  #	service again

  # TODO: enable logging according to $log parameter

  # Set purge of existing file
  resources { 'firewall':
    purge => true
  }

  if ($enabled) {
    # Create order to ensure pre/post rules
    Firewall {
      require => Class['iptables::pre'],
      before  => Class['iptables::post'],
    }

    # Load pre rules
    class { 'iptables::pre': }

    # Load all required roles
    class { $role: 
      before => Class['iptables::post']
    }

    # Load post rules
    class { 'iptables::post': }
  }

  # Ensure service status
  class { 'firewall':
    ensure  => $enabled? { true => running, default => stopped },
    require => Class['iptables::post']
  }
}
