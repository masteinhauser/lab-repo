name "lab-base"
description "Default run_list for Matts machines"
run_list(
  "recipe[apt::cacher-client]",
  "recipe[chef-pry]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[chef-client::config]",
  "recipe[chef-client::service]",
  "recipe[chef-client::delete_validation]"
  )

override_attributes(
  "ntp" => {
    "servers" => [ '10.0.0.2' ]
  }
)
