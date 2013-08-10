Vagrant.configure("2") do |config|
  config.butcher.knife_config_file = '.chef/knife.rb'
  config.berkshelf.enabled = false
  config.vm.box = "opscode-ubuntu-12.04"
  config.omnibus.chef_version = :latest

  config.vm.synced_folder ".vagrant/root", "/root"
  config.vm.synced_folder ".vagrant/opt/chef", "/opt/chef"
  config.vm.synced_folder ".vagrant/var/chef", "/var/chef"
  config.vm.synced_folder ".vagrant/var/cache/apt/archives", "/var/cache/apt/archives"

  config.vm.define :server do |server|
    config.vm.hostname = "server"
    config.vm.provision :chef_client do |chef|
      chef.chef_server_url = "https://api.opscode.com/organizations/os-testing"
      chef.validation_client_name = "os-testing-validator"
      chef.validation_key_path = ".chef/os-testing-validator.pem"
      chef.environment = "vagrant"
      chef.run_list = ["role[lab-admin]"]
    end
  end

  # config.vm.define :client do |client|
  #   config.vm.hostname = "client"
  #   config.vm.provision :chef_client do |chef|
  #     chef.chef_server_url = "https://api.opscode.com/organizations/matt2"
  #     chef.validation_client_name = "matt2-validator"
  #     chef.validation_key_path = ".chef/matt2-validator.pem"
  #     chef.environment = "home"
  #     chef.run_list = ["recipe[apt::cacher-client]"]
  #   end
  # end

end
