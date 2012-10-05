#
# Cookbook Name:: labsetup
# Recipe:: default
#
# Copyright 2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

interfaces = "#managed by the Chef labsetup cookbook
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

# Bridge network interface for VM networks
auto br100
iface br100 inet static
address 192.168.100.1
netmask 255.255.255.0
bridge_stp off
bridge_fd 0

auto eth1
iface eth1 inet dhcp
"

service "networking" do
  ignore_failure true
  action :nothing
end

file "/etc/network/interfaces" do
  content interfaces
  owner "root"
  group "root"
  mode "0755"
  action :create
  notifies :restart, "service[networking]"
end

# insert_line_if_no_match to append to /etc/chef/client.rb
ruby_block "chef/client.rb log_level" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/chef/client.rb")
    rc.insert_line_if_no_match(/fatal$/,"log_level :fatal")
    rc.write_file
  end
end

ruby_block "chef/client.rb formatter" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/chef/client.rb")
    rc.insert_line_if_no_match(/^formatter/,"formatter \"doc\"")
    rc.write_file
  end
end
