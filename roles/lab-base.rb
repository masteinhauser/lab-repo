name "lab-base"
description "Default run_list for Matts machines"
run_list(
  "recipe[apt::cacher-client]",
  "recipe[labsetup]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[chef-client::delete_validation]"
  )
