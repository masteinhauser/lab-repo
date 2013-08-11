name "home"
description "Home infrastructure."

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
  },
  "pxe_dust" => {
    "default" => {
      "domain" => "home.atx",
      "environment" => "home"
    }
  }
  )

