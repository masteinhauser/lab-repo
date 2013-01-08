name "lab-admin"
description "Default run_list for the Admin node"
run_list(
  "recipe[apt::cacher-ng]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[chef-client]",
  "recipe[pxe_dust]"
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

override_attributes(
  "apache" => {
    "default_site_enabled" => true
  }
  )
