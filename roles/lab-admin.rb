name "lab-admin"
description "Default run_list for the Admin node"
run_list(
  "recipe[apt::cacher-ng]",
  "recipe[pxe_dust::server]",
  "recipe[sudo]",
  "recipe[ntp]"
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
