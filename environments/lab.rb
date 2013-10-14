name 'lab'
description 'Environment defining the lab support infrastructure.'

override_attributes(
  'apt' => {
    'cacher-client' => {
      'restrict_environment' => true
    },
    'cacher_interface' => 'eth0'
  },
  'authorization' => {
    'sudo' => {
      'groups' => ['admin', 'wheel', 'sysadmin'],
      'users' => ['mray'],
      'passwordless' => true,
      'include_sudoers_d' => true
    }
  },
  'dnsmasq' => {
    'enable_dhcp' => true,
    'enable_dns' => false,
    'dhcp' => {
      'dhcp-authoritative' => nil,
      'dhcp-range' => 'eth0,10.0.0.10,10.0.0.100,12h',
      'dhcp-option' => '3', #turns off everything except basic DHCP
      'domain' => 'lab.atx',
      'interface' => 'eth0',
      'dhcp-boot' => 'pxelinux.0',
      'enable-tftp' => nil,
      'tftp-root' => '/var/lib/tftpboot',
      'tftp-secure' => nil
    },
    'dhcp_options' => [
      'dhcp-host=10:78:d2:c8:b2:51,ignar,10.0.0.12',
      'dhcp-host=00:19:66:16:b8:d9,lrrr,10.0.0.14',
      'dhcp-host=10:78:d2:c8:b2:07,larry,10.0.0.13',
      'dhcp-host=80:ee:73:0a:fa:d9,crushinator,10.0.0.11'
    ]
  },
  'pxe_dust' => {
    'chefversion' => '11.6.2',
    'interface' => 'eth0'
  }
  )
