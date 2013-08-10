name "vagrant"
description "Vagrant infrastructure."

override_attributes(
  "apt" => {
    "cacher-client" => {
      "restrict_environment" => true
    }
  },
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel", "sysadmin"],
      "users" => ["mray"],
      "passwordless" => true,
      "include_sudoers_d" => true
    }
  }
  )
