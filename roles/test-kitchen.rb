name "test-kitchen"
description "Configure Vagrant for Test-Kitchen"
run_list(
  "recipe[virtualbox]",
  "recipe[vagrant]",
  "recipe[test-kitchen]"
  )

override_attributes(
  "vagrant" => {
    "url" => "http://files.vagrantup.com/packages/b12c7e8814171c1295ef82416ffe51e8a168a244/vagrant_1.3.1_x86_64.deb",
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
