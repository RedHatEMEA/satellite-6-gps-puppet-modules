# == Class: iptables
#
# Class to install and configure iptables service in RHEL installations
#
# === Parameters
#
# [*enabled*]
#  String. Defines service status at boottime
#  Valid options: true, false, manual
#  Default: true
#
# [*policy*]
#  String. Defines the default policy to apply to unmatched traffic
#  Valid options: accept, reject, drop
#  Default: accept
#
# [*role*]
#  Array. Defines all included roles in the server. These must exist as classes.
#  Valid options: any class defined as role which uses puppetlabs-firewall module
#  Default: empty
#
# === Variables
#
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
# === Copyright
#
# Copyright 2014 Red Hat.
#
class iptables (
	$enabled = false,
	$policy	 = 'accept',
	$log 	 = false,
	$role 	 = [],
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

		# Load pre/post rules
		class { ['iptables::pre', 'iptables::post']: }

		# Load all required roles
		class { $role: }
	}

	# Ensure service status
	class { 'firewall':
		ensure => $enabled? {true => 'running', default => 'stopped'},
	}
}
