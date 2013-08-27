name "vagrant"
description "Configure Vagrant for Test-Kitchen"
run_list(
  "recipe[virtualbox]",
  "recipe[vagrant]",
  "recipe[test-kitchen]"
  )

override_attributes(
  "vagrant" => {
    "url" => "http://files.vagrantup.com/packages/7ec0ee1d00a916f80b109a298bab08e391945243/vagrant_1.2.7_x86_64.deb",
    "plugins" => ["vagrant-omnibus", "vagrant-berkshelf"]
  },
  "test-kitchen" => {
    "user" => 'mray'
  },
  "build_essential" => {
    "compiletime" => true
  }
  )
