class iptables::post inherits iptables {
	# TODO: implemente logging before applying default action
	firewall { '999 Apply policy':
		proto   => 'all',
		action  => $::iptables::policy,
		before  => undef,
	}
}
