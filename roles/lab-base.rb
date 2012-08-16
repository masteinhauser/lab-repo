name "lab-base"
description "Default run_list for Matts machines"
run_list(
  "recipe[apt::cacher-client]",
  "recipe[labsetup]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[users::sysadmins]",
  "recipe[sudo]"
  )

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel", "sysadmin"],
      "users" => ["mray"],
      "passwordless" => true,
      "include_sudoers_d" => true
    }
  }
  )
