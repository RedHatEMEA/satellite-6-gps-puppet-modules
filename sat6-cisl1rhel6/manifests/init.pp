# = Class: cisl1rhel6
#
# This puppet manifest implements the RHEL 6 CIS Level 1 Server Hardening
# Recommendations as follow (from doc version 1.3 5/6/2014)
#
# ! = >  means not implemented / enforced here
#
# ! 1.1.1  /tmp separate partition (-> kickstart)
#   1.1.2  /tmp nodev
#   1.1.3  /tmp nosuid
#   1.1.4  /tmp noexec
# ! 1.1.5  /var separate partition (-> kickstart)
#   1.1.6  Bind mount (/tmp /var/tmp none rw,noexec,nosuid,nodev,bind 0 0)
# ! 1.1.7  /var/log separate partition (-> kickstart)
# ! 1.1.8  /var/log/audit separate partition (-> kickstart)
# ! 1.1.9  /home separate partition (-> kickstart)
#   1.1.10 /home nodev
# ! 1.1.11 nodev to removable partitions
# ! 1.1.12 noexec to removable partitions
# ! 1.1.13 nosuid to removeable partitions
#   1.1.14 /dev/shm nodev
#   1.1.15 /dev/shm nosuid
#   1.1.16 /dev/shm noexec
# ! 1.1.17 Find Sticky Bit on all world writable directories (manual correction)
#   
# ! 1.2.1  RHN RPM repos configured (manual correction)
# ! 1.2.2  Verify Red Hat GPG Key installed	(manual correction)
# ! 1.2.3  GPG check globally activated	(manual correction)
# ! 1.2.5  Keep System Up to date with YUM	(manual correction)
# ! 1.2.6  Verify package integrity using RPM (manual correction)
#   
#   1.5.1  /etc/grub.conf owner root:root
#   1.5.2  /etc/grub.conf permissions og-rwx
#   1.5.3  /etc/grub.conf boot loader password
#   1.5.4  Single-User-Mode authentication
#   1.5.5  Interactive Boot disabled
#   
#   1.6.1  Core dumps hard limit
#   1.6.2  Exec-shield enabled
#   1.6.3  Randomised Virtual Memory enforced
# ! 1.1.7  Use latest OS release (manual correction)
#   
#   2.1.1  telnet-server removed
#   2.1.2  telnet client removed
#   2.1.3  rsh-server removed
#   2.1.4  rsh clients removed
#   2.1.5  NIS ypbind client removed
#   2.1.6  NIS server ypserv removed
#   2.1.7  tftp client removed
#   2.1.8  tftp-server removed
#   2.1.9  talk client removed
#   2.1.10 talk-server removed
#   2.1.11 xinetd services removed
#   2.1.12 chargen-dgram disabled
#   2.1.13 chargen-stream disabled
#   2.1.14 daytime-dgram disabled
#   2.1.15 daytime-stream disabled
#   2.1.16 echo-dgram disabled
#   2.1.17 echo-stream disabled
#   2.1.18 tcpmux-server disabled
#   
#   3.1    umask default daemon 027
# ! 3.2    X-Windows removed
#   3.3    avahi-daemon (multicast DNS discovery) disabled
#   3.4    CUPS disabled
#   3.5    DHCP server removed
#   3.6    NTP configured
#   3.7    LDAP removed
#   3.8    NFS and RPC disabled
#   3.9    DNS server bind removed
#   3.10   FTP server removed
#   3.11   HTTP server removed
#   3.12   Dovecot (IMAP & POP3 services) removed
#   3.13   Samba removed
#   3.14   HTTP Proxy squid removed
#   3.15   SNMP server net-snmp removed
#   3.16   postfix MTA localhost only config
#   
#   4.1.1  IP Forwarding ip_forward disabled
#   4.1.2  Send Packet Redirects send_redirects disabled
#   
#   4.2.1  Source Routed Packet Acceptance accept_source_route disabled
#   4.2.2  ICMP Redirect Acceptance accept_redirects disabled
#   4.2.3  Secure ICMP Redirect Acceptance secure_redirects disabled
#   4.2.4  Log Suspicious Packets log_martians enabled
#   4.2.5  Ignore Broadcast Requests icmp_echo_ignore_broadcasts enabled
#   4.2.6  Bad Error Message protection icmp_ignore_bogus_error_messages
#   4.2.8  TCP SYN Cookies tcp_syncookies enabled
#   
# ! 4.3    Wireless Networking disabled (interfaces param)
#   
#   4.4.2  Disable IPv6
#   
#   4.5.1  TCP Wrappers tcp_wrappers installed
#   4.5.2  /etc/hosts.allow configured
#   4.5.3  /etc/hosts.allow owner & permissions root:root 2055
#   4.5.4  /etc/hosts.deny configured
#   4.5.5  /etc/hosts.deny owner & permissions root:root 2055
#   
#   4.6.1  DCCP network interface (streaming media) disabled
#   4.6.2  SCTP network interface (streaming media) disabled
#   4.6.3  RDS network interface (cluster nodes) disabled
#   4.6.4  TIPC network interface (cluster node comms) disabled
#   
#   4.7    iptables enabled
# ! 4.8    ip6tables enabled (IPv6 disabled)
#   
#   5.1.1  rsyslog installed
#   5.1.2  rsyslog enabled
#   5.1.3  /etc/rsyslog.conf configured
# ! 5.1.4  /var/log files exist with correct permissions for rsyslog
#          (manual configure)
# ! 5.1.5  rsyslog remote logging (manual configure)
# ! 5.1.6  rsyslog receive messages from remote hosts (manual configure)
#   
#   5.3    logrotate /etc/logrotate.d/syslog configured
#   
#   6.1.1  anacron enabled
#   6.1.2  crond enabled
#   6.1.3  /etc/anacrontab owner & permissions root:root og-rwx
#   6.1.4  /etc/crontab owner & permissions root:root og-rwx
#   6.1.5  /etc/cron.hourly owner & permissions root:root og-rwx
#   6.1.6  /etc/cron.daily owner & permissions root:root og-rwx
#   6.1.7  /etc/cron.weekly owner & permissions root:root og-rwx
#   6.1.8  /etc/cron.monthly owner & permissions root:root og-rwx
#   6.1.9  /etc/cron.d owner & permissions root:root og-rwx
#   6.1.10 at daemon /etc/at.{allow,deny} owner & permissions root:root og-rwx
#   6.1.11 /etc/cron.allow and /etc/at.allow authorised users
#   
#   6.2.1  sshd Protocol 2 (SSH v2)
#   6.2.2  sshd LogLevel INFO
#   6.2.3  /etc/ssh/sshd_config owner & permissions root:root 600
#   6.2.4  sshd X11Forwarding no
#   6.2.5  sshd MaxAuthTries 4
#   6.2.6  sshd IgnoreRhosts yes (.rhosts, .shosts)
#   6.2.7  sshd HostbasedAuthentication no
#   6.2.8  sshd disable root login via ssh PermitRootLogin no
#   6.2.9  sshd PermitEmptyPassword no
#   6.2.10 sshd PermitUserEnvironment no
#   6.2.11 sshd Ciphers aes128-ctr,aes192-ctr,aes256-ctr
#   6.2.12 sshd Idle Timeout 5 minutes:
#          ClientAliveInterval 300, ClientAliveCountMax 0
# ! 6.2.13 sshd limited users: AllowUsers, AllowGroups, DenyUsers, DenyGroups
#   6.2.14 sshd Banner /etc/issue.net
#   
#   6.3.1  PAM Password Hashing Algorithm to SHA-512 (authconfig)
#   6.3.2  PAM /etc/pam.d/system-auth pam_cracklib.so password policy
#   6.3.3  PAM /etc/pam.d/system-auth pam_tally2 failed attempts lockout policy
#   6.3.4  PAM /etc/pam.d/system-auth remember password reuse policy
#   
#   6.4    /etc/securetty remove terminals not required for root authentication
#   6.5    /etc/pam.d/su restrict access to su command: wheel user list
#   
#   7.1.1  /etc/login.defs set PASS_MAX_DAYS 90
#   7.1.2  /etc/login.defs set PASS_MIN_DAYS 7
#   7.1.3  /etc/login.defs set PASS_WARN_AGE 7
#   
#   7.2    /etc/passwd disable system account (uid<500 set shell /sbin/nologin)
#   7.3    /etc/passwd root account group set to GID 0
#   7.4    /etc/bashrc and /etc/profile.d/* umask default set to 077
# ! 7.5    Disable accounts that have been inactive > 35 days
#   
#   8.1    /etc/issue, issue.net and /etc/motd banner warnings
# ! 8.2    No OS information in 8.1	
# ! 8.3    GNOME banner warning (manual gconf tool execution)
#   
#   9.1.2  /etc/passwd permissions check 644
#   9.1.3  /etc/shadow permissions check 000
#   9.1.4  /etc/gshadow permissions check 000
#   9.1.5  /etc/group permissions check 644
#   9.1.6  /etc/passwd owner check root:root
#   9.1.7  /etc/shadow owner check root:root
#   9.1.8  /etc/gshadow owner check root:root
#   9.1.9  /etc/group owner check root:root
#   
#   More General audit scripts than puppet config and enforcement:
#   
# ! 9.1.10 Secure world writable files find .. chmod w-o (manual correction)
# ! 9.1.11 Find unowned files and directories (manual correction)
# ! 9.1.12 Find files owned by users not listed in system (manual correction)
# ! 9.1.13 Find SUID system executable files (manual correction)
# ! 9.1.14 Find SGID system executable files (manual correction)
#   
# ! 9.2.1  /etc/shadow password files not empty
# ! 9.2.2  /etc/passwd no legacy "+" entries exist (NIS)
# ! 9.2.3  /etc/shadow no legacy "+" entries exist (NIS)
# ! 9.2.4  /etc/group no legacy "+" entries exist (NIS)
# ! 9.2.5  /etc/passwd no non-root UID 0 accounts exist
# ! 9.2.6  Check root's PATH for invalid executable directories (manual)
# ! 9.2.7  /etc/passwd check user home directory permissions
# ! 9.2.8  /etc/passwd check user's dot file permissions
# ! 9.2.9  /etc/passwd check user's .netrc file permissions
# ! 9.2.10 /etc/passwd check for presence of user .rhosts file
# ! 9.2.11 /etc/passwd check groups are defined in /etc/group
# ! 9.2.12 /etc/passwd check users have valid home directories defined
# ! 9.2.13 /etc/passwd check user home directory ownership
# ! 9.2.14 /etc/passwd check for duplicate UIDs
# ! 9.2.15 /etc/group check for duplicate GIDs
# ! 9.2.16 /etc/passwd check for duplicate usernames
# ! 9.2.17 /etc/group check for duplicate group names
# ! 9.2.18 /etc/passwd check for presence of user .netrc files
# ! 9.2.19 /etc/passwd check for presence of user .forward files
#   
#
# == Parameters:
#
# == Variables:
#
# == Authors:
#
# Author Name <ghares@redhat.com>
#
# == Copyright:
#
# Copyright 2015 Red Hat Inc, unless otherwise noted.
#
#
class cisl1rhel6 {

  include cisl1rhel6::params

  # Main:

  # 1.1.2  /tmp nodev
  # 1.1.3  /tmp nosuid
  # 1.1.4  /tmp noexec
  # 1.1.6  Bind mount (/tmp /var/tmp none rw,noexec,nosuid,nodev,bind 0 0)
  # 1.1.10 /home nodev
  # 1.1.14 /dev/shm nodev
  # 1.1.15 /dev/shm nosuid
  # 1.1.16 /dev/shm noexec

  include cisl1rhel6::partitions


  # 1.5.1  /etc/grub.conf owner root:root
  # 1.5.2  /etc/grub.conf permissions og-rwx
  # 1.5.3  /etc/grub.conf boot loader password

  include cisl1rhel6::grub


  # 1.5.4  Single-User-Mode authentication (init)
  # 1.5.5  Interactive Boot disabled (init)
  # 3.1    umask default daemon 027 (init)

  include cisl1rhel6::boot


  # 1.6.1  Core dumps hard limit (security limits)

  include cisl1rhel6::limits


  # 1.6.2  Exec-shield enabled (sysctl)
  # 1.6.3  Randomised Virtual Memory enforced (sysctl)
  # 4.1.1  IP Forwarding ip_forward disabled (sysctl)
  # 4.1.2  Send Packet Redirects send_redirects disabled (sysctl)
  # 4.2.1  Source Routed Packet Acceptance accept_source_route disabled (sysctl)
  # 4.2.2  ICMP Redirect Acceptance accept_redirects disabled (sysctl)
  # 4.2.3  Secure ICMP Redirect Acceptance secure_redirects disabled (sysctl)
  # 4.2.4  Log Suspicious Packets log_martians enabled (sysctl)
  # 4.2.5  Ignore Broadcast Requests icmp_echo_ignore_broadcasts enabled (sysctl)
  # 4.2.6  Bad Error Message protection icmp_ignore_bogus_error_messages (sysctl)
  # 4.2.8  TCP SYN Cookies tcp_syncookies enabled (sysctl)

  include cisl1rhel6::sysctl


  # 2.1.1  telnet-server removed
  # 2.1.2  telnet client removed
  # 2.1.3  rsh-server removed
  # 2.1.4  rsh clients removed
  # 2.1.5  NIS ypbind client removed
  # 2.1.6  NIS server ypserv removed
  # 2.1.7  tftp client removed
  # 2.1.8  tftp-server removed
  # 2.1.9  talk client removed
  # 2.1.10 talk-server removed
  # 2.1.11 xinetd services removed
  # 2.1.12 chargen-dgram disabled
  # 2.1.13 chargen-stream disabled
  # 2.1.14 daytime-dgram disabled
  # 2.1.15 daytime-stream disabled
  # 2.1.16 echo-dgram disabled
  # 2.1.17 echo-stream disabled
  # 2.1.18 tcpmux-server disabled
  # 3.5    DHCP server removed
  # 3.7    LDAP removed
  # 3.9    DNS server bind removed
  # 3.10   FTP server removed
  # 3.11   HTTP server removed
  # 3.12   Dovecot (IMAP & POP3 services) removed
  # 3.13   Samba removed
  # 3.14   HTTP Proxy squid removed
  # 3.15   SNMP server net-snmp removed
  # 4.5.1  TCP Wrappers tcp_wrappers installed

  include cisl1rhel6::packages


  # 3.3    avahi-daemon (multicast DNS discovery) disabled
  # 3.4    CUPS disabled
  # 3.8    NFS and RPC disabled

  include cisl1rhel6::services


  # 3.6    NTP configured

  include cisl1rhel6::ntpconf


  # 3.16

  include cisl1rhel6::postfix


  # 4.4.2  Disable IPv6

  include cisl1rhel6::noipv6


  # 4.5.2  /etc/hosts.allow configured
  # 4.5.3  /etc/hosts.allow owner & permissions root:root 2055
  # 4.5.4  /etc/hosts.deny configured
  # 4.5.5  /etc/hosts.deny owner & permissions root:root 2055

  include cisl1rhel6::hostsaccess


  # 4.6.1  DCCP network interface (streaming media) disabled
  # 4.6.2  SCTP network interface (streaming media) disabled
  # 4.6.3  RDS network interface (cluster nodes) disabled
  # 4.6.4  TIPC network interface (cluster node comms) disabled

  include cisl1rhel6::interfaces


  # 4.7    iptables enabled

  include cisl1rhel6::iptables


  # 5.1.1  rsyslog installed
  # 5.1.2  rsyslog enabled
  # 5.1.3  /etc/rsyslog.conf configured
  # 5.3    logrotate /etc/logrotate.d/syslog configured

  include cisl1rhel6::syslogconf


  # 6.1.1  anacron enabled
  # 6.1.2  crond enabled
  # 6.1.3  /etc/anacrontab owner & permissions root:root og-rwx
  # 6.1.4  /etc/crontab owner & permissions root:root og-rwx
  # 6.1.5  /etc/cron.hourly owner & permissions root:root og-rwx
  # 6.1.6  /etc/cron.daily owner & permissions root:root og-rwx
  # 6.1.7  /etc/cron.weekly owner & permissions root:root og-rwx
  # 6.1.8  /etc/cron.monthly owner & permissions root:root og-rwx
  # 6.1.9  /etc/cron.d owner & permissions root:root og-rwx
  # 6.1.10 at daemon /etc/at.{allow,deny} owner & permissions root:root og-rwx
  # 6.1.11 /etc/cron.allow and /etc/at.allow authorised users

  include cisl1rhel6::cronconf


  # 6.2.1  sshd Protocol 2 (SSH v2)
  # 6.2.2  sshd LogLevel INFO
  # 6.2.3  /etc/ssh/sshd_config owner & permissions root:root 600
  # 6.2.4  sshd X11Forwarding no
  # 6.2.5  sshd MaxAuthTries 4
  # 6.2.6  sshd IgnoreRhosts yes (.rhosts, .shosts)
  # 6.2.7  sshd HostbasedAuthentication no
  # 6.2.8  sshd disable root login via ssh PermitRootLogin no
  # 6.2.9  sshd PermitEmptyPassword no
  # 6.2.10 sshd PermitUserEnvironment no
  # 6.2.11 sshd Ciphers aes128-ctr,aes192-ctr,aes256-ctr
  # 6.2.12 sshd Idle Timeout 5 minutes: ClientAliveInterval 300, ClientAliveCountMax 0
  # 6.2.14 sshd Banner /etc/issue.net

  include cisl1rhel6::sshdconf


  # 6.3.1  PAM Password Hashing Algorithm to SHA-512 (authconfig)
  # 6.3.2  PAM /etc/pam.d/system-auth pam_cracklib.so password policy
  # 6.3.3  PAM /etc/pam.d/system-auth pam_tally2 failed attempts lockout policy
  # 6.3.4  PAM /etc/pam.d/system-auth remember password reuse policy
  # 6.4    /etc/securetty remove terminals not required for root authentication
  # 6.5    /etc/pam.d/su restrict access to su command: wheel user list
  # 7.1.1  /etc/login.defs set PASS_MAX_DAYS 90
  # 7.1.2  /etc/login.defs set PASS_MIN_DAYS 7
  # 7.1.3  /etc/login.defs set PASS_WARN_AGE 7
  # 7.2    /etc/passwd set (non root/halt/shutdown) accounts nologin shell
  # 7.3    /etc/passwd root account group set to GID 0
  # 7.4    /etc/bashrc and /etc/profile.d/* umask default set to 077
  # 8.1    /etc/issue, issue.net and /etc/motd banner warnings
  # 9.1.2  /etc/passwd permissions check 644
  # 9.1.3  /etc/shadow permissions check 000
  # 9.1.4  /etc/gshadow permissions check 000
  # 9.1.5  /etc/group permissions check 644
  # 9.1.6  /etc/passwd owner check root:root
  # 9.1.7  /etc/shadow owner check root:root
  # 9.1.8  /etc/gshadow owner check root:root
  # 9.1.9  /etc/group owner check root:root

  include cisl1rhel6::authconf

}
