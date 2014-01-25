name 'lab'
description 'Environment defining the lab support infrastructure.'

override_attributes(
  'apt' => {
    'cacher_ipaddress' => '10.128.20.56',
    'cacher-client' => {
      'restrict_environment' => true
    },
    'cacher_interface' => 'eth1'
  },
  'authorization' => {
    'sudo' => {
      'groups' => ['admin', 'wheel', 'sysadmin'],
      'users' => ['msteinhauser', 'ccope'],
      'passwordless' => true,
      'include_sudoers_d' => true
    }
  },
  'chef_client' => {
    'config' => {
      'http_retry_delay' => 10,
      'log_level' => ':warn'
    }
  },
  'chef-server' => {
    # 'configuration' => {
    #   'nginx' => {
    #     'non_ssl_port' => 8000
    #   }
    # },
    'package_file' => 'http://10.128.20.56:9630/chef-full-stack/chef-server_11.0.10-1.ubuntu.12.04_amd64.deb',
    'package_checksum' => '7c4b2407d44bbd0e39f7ecdc5eee8106919dee8bdad64b38f1da4b759cf3d67f'
  },
  'dnsmasq' => {
    'enable_dhcp' => true,
    'enable_dns' => false,
    'dhcp' => {
      'dhcp-authoritative' => nil,
      'dhcp-range' => 'eth1,10.128.20.50,10.128.20.100,12h',
      'dhcp-option' => '3', #turns off everything except basic DHCP
      'domain' => 'lab.bos',
      'interface' => 'eth1',
      'dhcp-boot' => 'pxelinux.0',
      'enable-tftp' => nil,
      'tftp-root' => '/var/lib/tftpboot',
      'tftp-secure' => nil
    },
    'dhcp_options' => [
      'dhcp-host=5C:26:0A:FC:C6:92,m1000e-06,10.128.20.50',
      'dhcp-host=00:23:AE:ED:77:22,m1000e-01,10.128.20.51',
      'dhcp-host=00:23:AE:ED:77:82,m1000e-02,10.128.20.52',
      'dhcp-host=00:23:AE:ED:77:2A,m1000e-03,10.128.20.53',
      'dhcp-host=00:23:AE:ED:75:6A,m1000e-04,10.128.20.54',
      'dhcp-host=5C:26:0A:FC:C7:2A,m1000e-05,10.128.20.55'
      #'dhcp-host=00:19:66:16:b8:d9,c6105-01,10.128.20.61',
      #'dhcp-host=00:19:66:16:b8:d9,c6105-02,10.128.20.62',
      #'dhcp-host=00:19:66:16:b8:d9,c6105-03,10.128.20.63',
      #'dhcp-host=00:19:66:16:b8:d9,c6105-04,10.128.20.64'
    ]
  },
  "ntp" => {
    "sync_clock" => true,
    "sync_hw_clock" => true
  },
  'pxe_dust' => {
    'chefversion' => '11.8.2',
    'interface' => 'eth1',
    'chef_server_url' => 'https://bootstrap.lab.box',
    'validation_client_name' => 'admin',
    'validation_key' => '/etc/chef-server/guenter.pem'
  }
  )
