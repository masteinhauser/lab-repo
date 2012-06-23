name "lab-base"
description "Default run_list for Matts machines"
run_list(
  "recipe[apt::cacher-client]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[build-essential]",
  "recipe[users::sysadmins]",
  "recipe[sudo]"
  )

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel", "sysadmin"],
      "users" => ["mray"],
      "passwordless" => true
    }
  }
  )
