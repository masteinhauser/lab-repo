name "lab"
description "Environment defining the lab support infrastructure."

override_attributes(
  "apt" => {
    "cacher-client" => {
      "restrict_environment" => true
    }
  },
  "pxe_dust" => {
    "chefversion" => '11.6.0'
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
