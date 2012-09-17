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

interfaces = "auto lo
#managed by the Chef labsetup cookbook
iface lo inet loopback
auto eth0
iface eth0 inet dhcp

# auto br100
# iface br100 inet dhcp
#     bridge_ports    eth0
#     bridge_stp      off
#     bridge_maxwait  0
#     bridge_fd       0

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

