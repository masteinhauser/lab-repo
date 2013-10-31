name "test-kitchen"
description "Configure Vagrant for Test-Kitchen"
run_list(
  "recipe[virtualbox]",
  "recipe[vagrant]",
  "recipe[test-kitchen]"
  )

override_attributes(
  "vagrant" => {
    "url" => "http://mom.lab.atx/boxes/vagrant_1.3.5_x86_64.deb",
    "plugins" => ["vagrant-chef-zero", "vagrant-omnibus", "vagrant-berkshelf"]
  },
  "test-kitchen" => {
    "user" => 'mray',
    "version" => '1.0.0.beta.3'
  },
  "build_essential" => {
    "compiletime" => true
  },
  'virtualbox' => {
    'version' => '4.3'
  }
  )
