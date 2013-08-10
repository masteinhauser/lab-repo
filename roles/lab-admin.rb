name "lab-admin"
description "Default run_list for the Admin node"
run_list(
  "recipe[apt::cacher-ng]",
  "recipe[apt::cacher-client]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[chef-client]",
  "recipe[apache2]",
  "recipe[tftp::server]"
  # "recipe[pxe_dust]"
  )
