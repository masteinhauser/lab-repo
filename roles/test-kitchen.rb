name "test-kitchen"
description "Configure Vagrant for Test-Kitchen"
run_list(
  "recipe[virtualbox]",
  "recipe[vagrant]",
  "recipe[test-kitchen]"
  )

override_attributes(
  "vagrant" => {
    "url" => "http://files.vagrantup.com/packages/0ac2a87388419b989c3c0d0318cc97df3b0ed27d/vagrant_1.3.4_x86_64.deb",
    "plugins" => ["vagrant-omnibus", "vagrant-berkshelf"]
  },
  "test-kitchen" => {
    "user" => 'mray',
    "version" => '1.0.0.beta.3'
  },
  "build_essential" => {
    "compiletime" => true
  }
  )
